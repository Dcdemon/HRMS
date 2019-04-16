create or replace package hrms_house_pkg is

  -- Author  : WU
  -- Created : 2019/4/1 20:16:47
  -- Purpose : ������Ϣ����

  --ͨ��code��code_value��ȡcode_value_name
  function get_code_value_name(p_code       in varchar2,
                               p_code_value in varchar2) return varchar2;

  --ͨ��code��ȡʡ��
  function get_province_name(p_province_code in varchar2) return varchar2;

  --ͨ��city_code��ȡ����
  function get_city_name(p_city_code in varchar2) return varchar2;

  --ͨ��user_id��ȡuser_name
  function get_user_name(p_user_id in number) return varchar2;

  --����province_code��city_code��house_detail���Ͼ����ַ
  function get_address(p_province_code in varchar2,
                       p_city_code     in varchar2,
                       p_house_detail  in varchar2) return varchar2;

  --���ɷ��ݱ��룺FW+��+��+��ˮ�ţ�4λ��
  function get_new_house_code return varchar2;

  --���ɷ��ݱ��룺FW+��+��+��ˮ�ţ�4λ��
  function get_house_number(p_document_type     varchar2,
                            p_company_id        number,
                            p_operation_unit_id number,
                            p_operation_date    date,
                            p_created_by        number) return varchar2;

  --���뷿����Ϣ
  procedure insert_new_house(p_house_abbreviation   in varchar2, --���ݼ��
                             p_house_type_code      in varchar2, --��������code
                             p_bed_number_code      in varchar2, --��λcode
                             p_house_area_code      in varchar2, --�������code
                             p_house_status_code    in varchar2, --����״̬code
                             p_house_province_code  in varchar2, --ʡcode
                             p_house_city_code      in varchar2, --��code
                             p_house_detail         in varchar2, --��ϸ��ַ
                             p_intermediary_name    in varchar2, --�н�����
                             p_intermediary_contact in varchar2, --�н���ϵ��
                             p_intermediary_tel     in varchar2, --�н���ϵ�绰
                             p_landlord_name        in varchar2, --��������
                             p_landlord_tel         in varchar2, --������ϵ�绰
                             p_house_remark         in varchar2, --��ע
                             p_user_id              in number --������
                             );

  --���·�����Ϣ
  procedure update_house(p_house_id             in number, --id����
                         p_house_abbreviation   in varchar2, --���ݼ��
                         p_house_type_code      in varchar2, --��������code
                         p_bed_number_code      in varchar2, --��λcode
                         p_house_area_code      in varchar2, --�������code
                         p_house_status_code    in varchar2, --����״̬code
                         p_house_province_code  in varchar2, --ʡcode
                         p_house_city_code      in varchar2, --��code
                         p_house_detail         in varchar2, --��ϸ��ַ
                         p_intermediary_name    in varchar2, --�н�����
                         p_intermediary_contact in varchar2, --�н���ϵ��
                         p_intermediary_tel     in varchar2, --�н���ϵ�绰
                         p_landlord_name        in varchar2, --��������
                         p_landlord_tel         in varchar2, --������ϵ�绰
                         p_house_remark         in varchar2, --��ע
                         p_user_id              in number --������
                         );

  --�޸ķ���״̬
  procedure update_house_status(p_house_id          in number,
                                p_house_status_code in varchar2);

  --Ա����ס
  procedure check_in(p_house_id in number, p_user_id in number);

end hrms_house_pkg;
/
create or replace package body hrms_house_pkg is

  --ͨ��code��code_value��ȡcode_value_name
  function get_code_value_name(p_code       in varchar2,
                               p_code_value in varchar2) return varchar2 is
    v_code_value_name varchar2(30) := '';
  begin
    if (p_code is null ) or
       (p_code_value is null) then
      return '';
    end if;
    select code_value_name
      into v_code_value_name
      from sys_code_values_v
     where code = p_code
       and code_value = p_code_value;
    return v_code_value_name;
  exception
    when NO_DATA_FOUND then
      return null;
    when others then
      dbms_output.put_line('get_code_value_name others exception');
  end get_code_value_name;

  --ͨ��province_code��ȡʡ��
  function get_province_name(p_province_code in varchar2) return varchar2 is
    v_province_name varchar2(30) := '';
  begin
    if p_province_code is null then
      return '';
    end if;
    select description
      into v_province_name
      from fnd_region_code_vl
     where region_code = p_province_code;
    return v_province_name;
  exception
    when others then
      dbms_output.put_line('get_province_name others exception');
  end get_province_name;

  --ͨ��city_code��ȡ����
  function get_city_name(p_city_code in varchar2) return varchar2 is
    v_city_name varchar2(30) := '';
  begin
    if p_city_code is null then
      return '';
    end if;
    select description
      into v_city_name
      from fnd_region_code_vl
     where region_code = p_city_code;
    return v_city_name;
  exception
    when others then
      dbms_output.put_line('get_city_name others exception');
  end get_city_name;

  --ͨ��user_id��ȡuser_name
  function get_user_name(p_user_id in number) return varchar2 is
    v_user_name varchar2(30) := '';
  begin
    select description
      into v_user_name
      from sys_user
     where user_id = p_user_id;
    return v_user_name;
  exception
    when others then
      dbms_output.put_line('get_user_name others exception');
  end get_user_name;

  --����province_code��city_code��house_detail���Ͼ����ַ
  function get_address(p_province_code in varchar2,
                       p_city_code     in varchar2,
                       p_house_detail  in varchar2) return varchar2 is
    v_address       varchar2(100) := '';
    v_province_name varchar2(30);
    v_city_name     varchar2(30);
  begin
    v_province_name := get_province_name(p_province_code);
    v_city_name     := get_city_name(p_city_code);
    v_address       := v_province_name || v_city_name || p_house_detail;
    return v_address;
  exception
    when others then
      dbms_output.put_line('get_address others exception');
  end get_address;

  --���ɷ��ݱ��룺FW+��+��+��ˮ�ţ�4λ��
  function get_new_house_code return varchar2 is
    v_house_code varchar2(30);
    v_date_now   date := sysdate;
    v_next_val   number := hrms_house_code_sequence.nextval;
  begin
    v_house_code := 'FW' || to_char(v_date_now, 'yyyymm');
    if v_next_val < 10 then
      v_house_code := v_house_code || '000';
    elsif v_next_val < 100 then
      v_house_code := v_house_code || '00';
    elsif v_next_val < 1000 then
      v_house_code := v_house_code || '0';
    end if;
    v_house_code := v_house_code || v_next_val;
    return v_house_code;
  end get_new_house_code;

  --���ɷ��ݱ��룺FW+��+��+��ˮ�ţ�4λ��
  FUNCTION get_house_number(p_document_type     VARCHAR2,
                            p_company_id        NUMBER,
                            p_operation_unit_id NUMBER,
                            p_operation_date    DATE,
                            p_created_by        NUMBER) RETURN VARCHAR2 IS
    c_coding_usage_code CONSTANT VARCHAR2(30) := '51';
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
  END get_house_number;

  --���뷿����Ϣ
  procedure insert_new_house(p_house_abbreviation   in varchar2, --���ݼ��
                             p_house_type_code      in varchar2, --��������code
                             p_bed_number_code      in varchar2, --��λcode
                             p_house_area_code      in varchar2, --�������code
                             p_house_status_code    in varchar2, --����״̬code
                             p_house_province_code  in varchar2, --ʡcode
                             p_house_city_code      in varchar2, --��code
                             p_house_detail         in varchar2, --��ϸ��ַ
                             p_intermediary_name    in varchar2, --�н�����
                             p_intermediary_contact in varchar2, --�н���ϵ��
                             p_intermediary_tel     in varchar2, --�н���ϵ�绰
                             p_landlord_name        in varchar2, --��������
                             p_landlord_tel         in varchar2, --������ϵ�绰
                             p_house_remark         in varchar2, --��ע
                             p_user_id              in number --������
                             ) is
    v_house_id   number := hrms_house_id_sequence.nextval; --id
    v_date       date := sysdate; --��������
    v_house_code varchar2(30) := get_house_number(p_document_type     => null,
                                                  p_company_id        => 150,
                                                  p_operation_unit_id => null,
                                                  p_operation_date    => v_date,
                                                  p_created_by        => p_user_id);
  begin
    insert into hrms_house
      (house_id,
       house_code,
       house_abbreviation,
       house_type_code,
       bed_number_code,
       house_area_code,
       house_status_code,
       house_province_code,
       house_city_code,
       house_detail,
       intermediary_name,
       intermediary_contact,
       intermediary_tel,
       landlord_name,
       landlord_tel,
       house_remark,
       living_person,
       rest_bed,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_house_id,
       v_house_code,
       p_house_abbreviation,
       p_house_type_code,
       p_bed_number_code,
       p_house_area_code,
       p_house_status_code,
       p_house_province_code,
       p_house_city_code,
       p_house_detail,
       p_intermediary_name,
       p_intermediary_contact,
       p_intermediary_tel,
       p_landlord_name,
       p_landlord_tel,
       p_house_remark,
       0,
       to_number(p_bed_number_code),
       p_user_id,
       v_date,
       p_user_id,
       v_date);
  exception
    when others then
      dbms_output.put_line('insert_new_house others exception');
  end insert_new_house;

  --���·�����Ϣ
  procedure update_house(p_house_id             in number, --id����
                         p_house_abbreviation   in varchar2, --���ݼ��
                         p_house_type_code      in varchar2, --��������code
                         p_bed_number_code      in varchar2, --��λcode
                         p_house_area_code      in varchar2, --�������code
                         p_house_status_code    in varchar2, --����״̬code
                         p_house_province_code  in varchar2, --ʡcode
                         p_house_city_code      in varchar2, --��code
                         p_house_detail         in varchar2, --��ϸ��ַ
                         p_intermediary_name    in varchar2, --�н�����
                         p_intermediary_contact in varchar2, --�н���ϵ��
                         p_intermediary_tel     in varchar2, --�н���ϵ�绰
                         p_landlord_name        in varchar2, --��������
                         p_landlord_tel         in varchar2, --������ϵ�绰
                         p_house_remark         in varchar2, --��ע
                         p_user_id              in number --������
                         ) is
  begin
    update hrms_house
       set house_abbreviation   = p_house_abbreviation,
           house_type_code      = p_house_type_code,
           bed_number_code      = p_bed_number_code,
           house_area_code      = p_house_area_code,
           house_status_code    = p_house_status_code,
           house_province_code  = p_house_province_code,
           house_city_code      = p_house_city_code,
           house_detail         = p_house_detail,
           intermediary_name    = p_intermediary_name,
           intermediary_contact = p_intermediary_contact,
           intermediary_tel     = p_intermediary_tel,
           landlord_name        = p_landlord_name,
           landlord_tel         = p_landlord_tel,
           house_remark         = p_house_remark,
           rest_bed             = to_number(p_bed_number_code) -
                                  living_person,
           last_updated_by      = p_user_id,
           last_updated_date    = sysdate
     where house_id = p_house_id;
  exception
    when others then
      dbms_output.put_line('update_house others exception');
  end update_house;

  --�޸ķ���״̬
  procedure update_house_status(p_house_id          in number,
                                p_house_status_code in varchar2) is
  begin
    update hrms_house
       set house_status_code = p_house_status_code
     where house_id = p_house_id;
  end update_house_status;

  --Ա����ס
  procedure check_in(p_house_id in number, p_user_id in number) is
    v_rest_bed number;
  begin
    select rest_bed
      into v_rest_bed
      from hrms_house
     where house_id = p_house_id;
    if v_rest_bed > 0 then
      update hrms_house
         set rest_bed          = rest_bed - 1,
             living_person     = living_person + 1,
             last_updated_by   = p_user_id,
             last_updated_date = sysdate
       where house_id = p_house_id;
    end if;
  end check_in;

end hrms_house_pkg;
/
