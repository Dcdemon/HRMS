create or replace package hrms_staff_pkg is

  -- Author  : WU
  -- Created : 2019/4/1 20:25:32
  -- Purpose : ��ס��Ա

  --������ס��Ա��ţ�RZRY+��+��+��ˮ�ţ�4λ��
  function get_new_check_in_staff_code return varchar2;

  --������Ա��Ϣ
  procedure insert_new_staff(p_job_number         in varchar2, --��Ա����
                             p_staff_name         in varchar2, --����
                             p_sex_code           in varchar2, --�Ա�code
                             p_department_code    in varchar2, --���ڲ���code
                             p_base_location_code in varchar2, --base��code
                             p_tel                in varchar2, --��ϵ�绰
                             p_email_address      in varchar2, --�����ַ
                             p_remark             in varchar2, --��ע
                             p_user_id            number);

  --������Ա��Ϣ
  procedure update_staff(p_check_in_staff_id    in number, --id����
                         p_staff_code           in varchar2, --��Ա���
                         p_job_number           in varchar2, --��Ա����
                         p_staff_name           in varchar2, --����
                         p_sex_code             in varchar2, --�Ա�code
                         p_department_code      in varchar2, --���ڲ���code
                         p_base_location_code   in varchar2, --base��code
                         p_tel                  in varchar2, --��ϵ�绰
                         p_check_in_status_code in varchar2, --��ס״̬code
                         p_email_address        in varchar2, --�����ַ
                         p_remark               in varchar2, --��ע
                         p_user_id              in number);

  --�޸���Ա��ס״̬
  procedure update_staff_check_in_status(p_check_in_staff_id    in number,
                                         p_check_in_status_code in varchar2,
                                         p_user_id              in number);

end hrms_staff_pkg;
/
create or replace package body hrms_staff_pkg is

  --������ס��Ա��ţ�RZRY+��+��+��ˮ�ţ�4λ��
  function get_new_check_in_staff_code return varchar2 is
    v_staff_code varchar2(30);
    v_date_now   date := sysdate;
    v_next_val   number := hrms_staff_code_S.Nextval;
  begin
    v_staff_code := 'RZRY' || to_char(v_date_now, 'yyyymm');
    if v_next_val < 10 then
      v_staff_code := v_staff_code || '000';
    elsif v_next_val < 100 then
      v_staff_code := v_staff_code || '00';
    elsif v_next_val < 1000 then
      v_staff_code := v_staff_code || '0';
    end if;
    v_staff_code := v_staff_code || v_next_val;
    return v_staff_code;
  end get_new_check_in_staff_code;

  --������Ա��Ϣ
  procedure insert_new_staff(p_job_number         in varchar2, --��Ա����
                             p_staff_name         in varchar2, --����
                             p_sex_code           in varchar2, --�Ա�code
                             p_department_code    in varchar2, --���ڲ���code
                             p_base_location_code in varchar2, --base��code
                             p_tel                in varchar2, --��ϵ�绰
                             p_email_address      in varchar2, --�����ַ
                             p_remark             in varchar2, --��ע
                             p_user_id            number) is
    v_check_in_staff_id    number; --id����
    v_staff_code           varchar2(30); --��Ա���
    v_check_in_status_code varchar2(30); --��ס״̬code
    v_date_now             date; --����ʱ��
  begin
    v_check_in_staff_id    := hrms_check_in_staff_S.Nextval;
    v_staff_code           := get_new_check_in_staff_code;
    v_check_in_status_code := 'NEW';
    v_date_now             := sysdate;
    insert into hrms_check_in_staff
      (check_in_staff_id,
       staff_code,
       job_number,
       staff_name,
       sex_code,
       department_code,
       base_location_code,
       tel,
       check_in_status_code,
       email_address,
       remark,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_check_in_staff_id,
       v_staff_code,
       p_job_number,
       p_staff_name,
       p_sex_code,
       p_department_code,
       p_base_location_code,
       p_tel,
       v_check_in_status_code,
       p_email_address,
       p_remark,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
    dbms_output.put_line(sql%rowcount);
  end insert_new_staff;

  --������Ա��Ϣ
  procedure update_staff(p_check_in_staff_id    in number, --id����
                         p_staff_code           in varchar2, --��Ա���
                         p_job_number           in varchar2, --��Ա����
                         p_staff_name           in varchar2, --����
                         p_sex_code             in varchar2, --�Ա�code
                         p_department_code      in varchar2, --���ڲ���code
                         p_base_location_code   in varchar2, --base��code
                         p_tel                  in varchar2, --��ϵ�绰
                         p_check_in_status_code in varchar2, --��ס״̬code
                         p_email_address        in varchar2, --�����ַ
                         p_remark               in varchar2, --��ע
                         p_user_id              in number) is
  begin
    update hrms_check_in_staff
       set staff_code           = p_staff_code,
           job_number           = p_job_number,
           staff_name           = p_staff_name,
           sex_code             = p_sex_code,
           department_code      = p_department_code,
           base_location_code   = p_base_location_code,
           tel                  = p_tel,
           check_in_status_code = p_check_in_status_code,
           email_address        = p_email_address,
           remark               = p_remark,
           last_updated_by      = p_user_id,
           last_updated_date    = sysdate
     where check_in_staff_id = p_check_in_staff_id;
  end update_staff;

  --�޸���Ա��ס״̬
  procedure update_staff_check_in_status(p_check_in_staff_id    in number,
                                         p_check_in_status_code in varchar2,
                                         p_user_id              in number) is
  begin
    update hrms_check_in_staff
       set check_in_status_code = p_check_in_status_code,
           last_updated_by      = p_user_id,
           last_updated_date    = sysdate
     where check_in_staff_id = p_check_in_staff_id;
  end update_staff_check_in_status;
  
  
end hrms_staff_pkg;
/
