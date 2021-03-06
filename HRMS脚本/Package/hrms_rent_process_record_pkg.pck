create or replace package hrms_rent_process_record_pkg is

  -- Author  : WU
  -- Created : 2019/4/1 20:29:55
  -- Purpose : 入住过程

  --插入入住过程记录
  procedure insert_new_rent_process_record(p_contract_id             number, --合同id
                                           p_staff_id                number, --入住人员id
                                           p_expected_living_to_date date, --预计入住时间至
                                           p_user_id                 number);

  --退房过程记录
  procedure check_out_record(p_rent_process_record_id in number,
                             p_check_out_date         in date,
                             p_user_id                in number);

end hrms_rent_process_record_pkg;
/
create or replace package body hrms_rent_process_record_pkg is

  --插入入住过程记录
  procedure insert_new_rent_process_record(p_contract_id             number, --合同id
                                           p_staff_id                number, --入住人员id
                                           p_expected_living_to_date date, --预计入住时间至
                                           p_user_id                 number) is
    v_date_now               date := sysdate;
    v_rent_process_record_id number := rent_process_record_S.Nextval;
    v_check_in_status_code   varchar2(30);
    v_house_id               number;
  begin
    select house_id
      into v_house_id
      from hrms_contract
     where contract_id = p_contract_id;
    select check_in_status_code
      into v_check_in_status_code
      from hrms_check_in_staff
     where check_in_staff_id = p_staff_id;
    if v_check_in_status_code <> 'CHECKED_IN' then
      insert into hrms_rent_process_record
        (rent_process_record_id,
         contract_id,
         staff_id,
         check_in_date,
         expected_living_to_date,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (v_rent_process_record_id,
         p_contract_id,
         p_staff_id,
         v_date_now,
         p_expected_living_to_date,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
      hrms_staff_pkg.update_staff_check_in_status(p_check_in_staff_id    => p_staff_id,
                                                  p_check_in_status_code => 'CHECKED_IN',
                                                  p_user_id              => p_user_id);
      hrms_house_pkg.check_in(p_house_id => v_house_id,
                              p_user_id  => p_user_id);
    end if;
  end insert_new_rent_process_record;

  --退房过程记录
  procedure check_out_record(p_rent_process_record_id in number,
                             p_check_out_date         in date,
                             p_user_id                in number) is
  begin
    --更新人员状态为已退租
    update hrms_check_in_staff
       set check_in_status_code = 'CHECKED_OUT',
           last_updated_by      = p_user_id,
           last_updated_date    = sysdate
     where check_in_staff_id =
           (select staff_id
              from hrms_rent_process_record
             where rent_process_record_id = p_rent_process_record_id);
    --更新房屋床位
    update hrms_house
       set living_person     = living_person - 1,
           rest_bed          = rest_bed + 1,
           last_updated_by   = p_user_id,
           last_updated_date = sysdate
     where house_id =
           (select house_id
              from hrms_contract
             where contract_id =
                   (select contract_id
                      from hrms_rent_process_record
                     where rent_process_record_id = p_rent_process_record_id));
    --更新入住过程记录表
    update hrms_rent_process_record
       set check_out_date    = p_check_out_date,
           last_updated_by   = p_user_id,
           total_living_day  = ceil(sysdate - check_in_date),
           last_updated_date = sysdate
     where rent_process_record_id = p_rent_process_record_id;
  
  end check_out_record;

end hrms_rent_process_record_pkg;
/
