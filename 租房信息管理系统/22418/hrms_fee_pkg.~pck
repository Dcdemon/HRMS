create or replace package hrms_fee_pkg is

  -- Author  : WU
  -- Created : 2019/4/2 11:19:53
  -- Purpose : 费用单

  --生成费用单编码：FYD+年+月+日+流水号（4位）
  FUNCTION get_fee_number(p_document_type     VARCHAR2,
                          p_company_id        NUMBER,
                          p_operation_unit_id NUMBER,
                          p_operation_date    DATE,
                          p_created_by        NUMBER) RETURN VARCHAR2;

  --插入新的费用单
  procedure insert_new_fee(p_fee_code        in varchar2,
                           p_start_date      in date,
                           p_end_date        in date,
                           p_fee_item_code   in varchar2,
                           p_fee_source_code in varchar2,
                           p_fee_house_id    in number,
                           p_fee_cost        in number,
                           p_currency_code   in varchar2,
                           p_remark          in varchar2,
                           p_user_id         in number);

  --计算费用明细并记录
  procedure count_fee_detail(p_fee_id        in number,
                             p_fee_house_id  in number,
                             p_fee_cost      in number,
                             p_start_date    in date,
                             p_end_date      in date,
                             p_fee_item_code in varchar2,
                             p_user_id       in number);

  --计算某月入住天数
  function count_living_days(p_check_in_date  in date,
                             p_check_out_date in date,
                             p_start_date     in date,
                             p_end_date       in date) return number;

  --插入费用明细表
  procedure insert_new_fee_detail(p_fee_id        in number,
                                  p_staff_id      in number,
                                  p_apportion_fee in number,
                                  p_user_id       in number);

  --债权表加入债权
  procedure add_fee_claim(p_contract_id   in number,
                          p_staff_id      in number,
                          p_fee_item_code in varchar2,
                          p_apportion_fee in number,
                          p_user_id       in number);

end hrms_fee_pkg;
/
create or replace package body hrms_fee_pkg is

  --生成费用单编码：FYD+年+月+日+流水号（4位）
  FUNCTION get_fee_number(p_document_type     VARCHAR2,
                          p_company_id        NUMBER,
                          p_operation_unit_id NUMBER,
                          p_operation_date    DATE,
                          p_created_by        NUMBER) RETURN VARCHAR2 IS
    c_coding_usage_code CONSTANT VARCHAR2(30) := '54';
    v_start_doc_number exp_report_headers.exp_report_number%TYPE;
  BEGIN
    v_start_doc_number := fnd_code_rule_pkg.get_rule_next_auto_num(p_document_category => c_coding_usage_code,
                                                                   p_document_type     => p_document_type,
                                                                   p_company_id        => p_company_id,
                                                                   p_operation_unit_id => p_operation_unit_id,
                                                                   p_operation_date    => p_operation_date,
                                                                   p_created_by        => p_created_by);
    IF fnd_code_rule_pkg.c_error = v_start_doc_number THEN
      RETURN fnd_code_rule_pkg.c_error;
    END IF;
    return v_start_doc_number;
  END get_fee_number;

  --插入新的费用单
  procedure insert_new_fee(p_fee_code        in varchar2, --费用单编号
                           p_start_date      in date, --费用开始日
                           p_end_date        in date, --费用结束日
                           p_fee_item_code   in varchar2, --费用项目code
                           p_fee_source_code in varchar2, --费用来源code
                           p_fee_house_id    in number, --费用对象（房屋id）
                           p_fee_cost        in number, --费用金额
                           p_currency_code   in varchar2, --币种code
                           p_remark          in varchar2, --备注
                           p_user_id         in number) is
    v_date_now   date := sysdate;
    v_fee_id     number := hrms_fee_S.Nextval;
    v_count      number := 0;
    v_rent_cost  number := 0;
    v_count_data number := 0;
    e_exists_error exception;
  begin
    --校验是否已经插入过
    select count(*)
      into v_count_data
      from hrms_fee
     where start_date = p_start_date
       and fee_item_code = p_fee_item_code
       and fee_house_id = p_fee_house_id;
    if v_count_data <> 0 then
      raise e_exists_error;
    end if;
    --插入
    insert into hrms_fee
      (fee_id,
       fee_code,
       start_date,
       end_date,
       fee_item_code,
       fee_source_code,
       fee_house_id,
       fee_cost,
       currency_code,
       remark,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_fee_id,
       p_fee_code,
       p_start_date,
       p_end_date,
       p_fee_item_code,
       p_fee_source_code,
       p_fee_house_id,
       p_fee_cost,
       p_currency_code,
       p_remark,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
    count_fee_detail(p_fee_id        => v_fee_id,
                     p_fee_house_id  => p_fee_house_id,
                     p_fee_cost      => p_fee_cost,
                     p_start_date    => p_start_date,
                     p_end_date      => p_end_date,
                     p_fee_item_code => p_fee_item_code,
                     p_user_id       => p_user_id);
    --检验房租，发布房租
    v_fee_id := hrms_fee_S.Nextval;
    select count(*)
      into v_count
      from hrms_fee
     where fee_house_id = p_fee_house_id
       and start_date = p_start_date
       and fee_item_code = 'RENT_FEE';
    if v_count = 0 then
      select month_rent_fee
        into v_rent_cost
        from hrms_contract
       where house_id = p_fee_house_id;
      insert into hrms_fee
        (fee_id,
         fee_code,
         start_date,
         end_date,
         fee_item_code,
         fee_source_code,
         fee_house_id,
         fee_cost,
         currency_code,
         remark,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (v_fee_id,
         get_fee_number(p_document_type     => null,
                        p_company_id        => 150,
                        p_operation_unit_id => null,
                        p_operation_date    => sysdate,
                        p_created_by        => p_user_id),
         p_start_date,
         p_end_date,
         'RENT_FEE',
         p_fee_source_code,
         p_fee_house_id,
         v_rent_cost,
         p_currency_code,
         '',
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
      count_fee_detail(p_fee_id        => v_fee_id,
                       p_fee_house_id  => p_fee_house_id,
                       p_fee_cost      => v_rent_cost,
                       p_start_date    => p_start_date,
                       p_end_date      => p_end_date,
                       p_fee_item_code => 'RENT_FEE',
                       p_user_id       => p_user_id);
    
    end if;
  exception
    --已存在的费用错误
    when e_exists_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'HRMS1050.FEE_EXISTS_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_package_name            => 'hrms_fee_pkg',
                                                      p_procedure_function_name => 'insert_new_fee');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end insert_new_fee;

  --计算费用明细并记录，并计入剩余债权
  procedure count_fee_detail(p_fee_id        in number,
                             p_fee_house_id  in number,
                             p_fee_cost      in number,
                             p_start_date    in date,
                             p_end_date      in date,
                             p_fee_item_code in varchar2,
                             p_user_id       in number) is
    v_contract_id number;
    v_i           number := 1;
    v_len         number;
    v_total       number := 0;
    v_total_t     number := 0;
    --定义数组
    type numberArray is table of number index by binary_integer;
    staff_ids     numberArray;
    living_days   numberArray;
    apportion_fee numberArray;
    v_temp_fee    number;
  begin
    --查合同id
    select contract_id
      into v_contract_id
      from hrms_contract
     where house_id = p_fee_house_id;
    --遍历该合同下的staff_id并计算天数
    for e in (select *
                from hrms_rent_process_record
               where contract_id = v_contract_id) loop
      --staff_id放入数组
      staff_ids(v_i) := e.staff_id;
      --入住天数放入数组
      living_days(v_i) := count_living_days(p_check_in_date  => e.check_in_date,
                                            p_check_out_date => e.check_out_date,
                                            p_start_date     => p_start_date,
                                            p_end_date       => p_end_date);
      v_total := v_total + living_days(v_i);
      v_i := v_i + 1;
    end loop;
    v_len := v_i - 1;
    for v_i in 1 .. v_len - 1 loop
      if v_total > 0 then
        apportion_fee(v_i) := round((living_days(v_i) / v_total) *
                                    p_fee_cost,
                                    2);
      else
        apportion_fee(v_i) := 0;
      end if;
      v_total_t := v_total_t + apportion_fee(v_i);
    end loop;
    if v_total > 0 then
      apportion_fee(v_len) := p_fee_cost - v_total_t;
    else
      apportion_fee(v_len) := 0;
    end if;
    for v_i in 1 .. v_len loop
      if apportion_fee(v_i) > 0 then
        v_temp_fee := apportion_fee(v_i);
        --加入债权表
        add_fee_claim(p_contract_id   => v_contract_id,
                      p_staff_id      => staff_ids(v_i),
                      p_fee_item_code => p_fee_item_code,
                      p_apportion_fee => v_temp_fee,
                      p_user_id       => p_user_id);
        --加入费用明细表
        insert_new_fee_detail(p_fee_id        => p_fee_id,
                              p_staff_id      => staff_ids(v_i),
                              p_apportion_fee => v_temp_fee,
                              p_user_id       => p_user_id);
      end if;
    end loop;
  end count_fee_detail;

  --计算某月入住天数
  function count_living_days(p_check_in_date  in date,
                             p_check_out_date in date,
                             p_start_date     in date,
                             p_end_date       in date) return number is
    v_living_days    number := 0;
    v_check_in_date  date := p_check_in_date;
    v_check_out_date date := p_check_out_date;
    v_start_date     date := p_start_date;
    v_end_date       date := p_end_date;
    v_check_days     number;
    v_month_days     number;
    v_interval_days  number;
    v_max_date       date;
    v_min_date       date;
  begin
    if p_check_out_date is null then
      v_check_out_date := p_end_date + 1;
    end if;
    if p_start_date >= v_check_out_date or p_check_in_date > p_end_date then
      v_living_days := 0;
    else
      if v_end_date > v_check_out_date then
        v_max_date := v_end_date;
      else
        v_max_date := v_check_out_date;
      end if;
      if v_start_date < v_check_in_date then
        v_min_date := v_start_date;
      else
        v_min_date := v_check_in_date;
      end if;
      v_check_days    := trunc(v_check_out_date) - trunc(v_check_in_date);
      v_month_days    := trunc(v_end_date) - trunc(v_start_date);
      v_interval_days := trunc(v_max_date) - trunc(v_min_date);
      v_living_days   := v_check_days + v_month_days - v_interval_days + 1;
    end if;
    return v_living_days;
  end count_living_days;

  --插入费用明细表
  procedure insert_new_fee_detail(p_fee_id        in number,
                                  p_staff_id      in number,
                                  p_apportion_fee in number,
                                  p_user_id       in number) is
    v_date_now      date := sysdate;
    v_fee_detail_id number := hrms_fee_detail_S.Nextval;
  begin
    insert into hrms_fee_detail
      (fee_detail_id,
       fee_id,
       staff_id,
       apportion_fee,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_fee_detail_id,
       p_fee_id,
       p_staff_id,
       p_apportion_fee,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
  
  end insert_new_fee_detail;

  --债权表加入债权
  procedure add_fee_claim(p_contract_id   in number, --合同id
                          p_staff_id      in number, --入住员工id
                          p_fee_item_code in varchar2, --费用项目
                          p_apportion_fee in number, --费用
                          p_user_id       in number) is
    v_count_num number;
    v_date_now  date := sysdate;
  begin
    select count(*)
      into v_count_num
      from hrms_fee_claim
     where contract_id = p_contract_id
       and staff_id = p_staff_id;
    if v_count_num = 0 then
      insert into hrms_fee_claim
        (fee_claim_id,
         contract_id,
         staff_id,
         rent_fee_remain,
         electricity_fee_remain,
         water_fee_remain,
         network_fee_remain,
         tv_fee_remain,
         rent_fee_total,
         electricity_fee_total,
         water_fee_total,
         network_fee_total,
         tv_fee_total,
         remark,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_fee_claim_S.Nextval,
         p_contract_id,
         p_staff_id,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         null,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
    if p_fee_item_code = 'ELECTRICITY _FEE' then
      update hrms_fee_claim
         set electricity_fee_remain = electricity_fee_remain +
                                      p_apportion_fee,
             electricity_fee_total  = electricity_fee_total +
                                      p_apportion_fee,
             last_updated_by        = p_user_id,
             last_updated_date      = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
    elsif p_fee_item_code = 'NETWORK_FEE' then
      update hrms_fee_claim
         set network_fee_remain = network_fee_remain + p_apportion_fee,
             network_fee_total  = network_fee_total + p_apportion_fee,
             last_updated_by    = p_user_id,
             last_updated_date  = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
    elsif p_fee_item_code = 'RENT_FEE' then
      update hrms_fee_claim
         set rent_fee_remain   = rent_fee_remain + p_apportion_fee,
             rent_fee_total    = rent_fee_total + p_apportion_fee,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
    elsif p_fee_item_code = 'TV_FEE' then
      update hrms_fee_claim
         set tv_fee_remain     = tv_fee_remain + p_apportion_fee,
             tv_fee_total      = tv_fee_total + p_apportion_fee,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
    elsif p_fee_item_code = 'WATER_FEE' then
      update hrms_fee_claim
         set water_fee_remain  = water_fee_remain + p_apportion_fee,
             water_fee_total   = water_fee_total + p_apportion_fee,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
    end if;
  end add_fee_claim;

end hrms_fee_pkg;
/
