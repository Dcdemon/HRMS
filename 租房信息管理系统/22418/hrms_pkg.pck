create or replace package hrms_pkg is

  -- Author  : WU
  -- Created : 2019/3/25 20:19:35
  -- Purpose : 租房管理系统

  --生成房屋编码：FW+年+月+流水号（4位）
  function get_new_house_code return varchar2;

  --生成房屋编码：FW+年+月+流水号（4位）
  function get_house_number(p_document_type     varchar2,
                            p_company_id        number,
                            p_operation_unit_id number,
                            p_operation_date    date,
                            p_created_by        number) return varchar2;

  --插入房屋信息
  procedure insert_new_house(p_house_abbreviation   in varchar2, --房屋简称
                             p_house_type_code      in varchar2, --房屋类型code
                             p_bed_number_code      in varchar2, --床位code
                             p_house_area_code      in varchar2, --房屋面积code
                             p_house_status_code    in varchar2, --房屋状态code
                             p_house_province_code  in varchar2, --省code
                             p_house_city_code      in varchar2, --市code
                             p_house_detail         in varchar2, --详细地址
                             p_intermediary_name    in varchar2, --中介名称
                             p_intermediary_contact in varchar2, --中介联系人
                             p_intermediary_tel     in varchar2, --中介联系电话
                             p_landlord_name        in varchar2, --房东姓名
                             p_landlord_tel         in varchar2, --房东联系电话
                             p_house_remark         in varchar2, --备注
                             p_user_id              in number --操作者
                             );

  --更新房屋信息
  procedure update_house(p_house_id             in number, --id主键
                         p_house_abbreviation   in varchar2, --房屋简称
                         p_house_type_code      in varchar2, --房屋类型code
                         p_bed_number_code      in varchar2, --床位code
                         p_house_area_code      in varchar2, --房屋面积code
                         p_house_status_code    in varchar2, --房屋状态code
                         p_house_province_code  in varchar2, --省code
                         p_house_city_code      in varchar2, --市code
                         p_house_detail         in varchar2, --详细地址
                         p_intermediary_name    in varchar2, --中介名称
                         p_intermediary_contact in varchar2, --中介联系人
                         p_intermediary_tel     in varchar2, --中介联系电话
                         p_landlord_name        in varchar2, --房东姓名
                         p_landlord_tel         in varchar2, --房东联系电话
                         p_house_remark         in varchar2, --备注
                         p_user_id              in number --操作者
                         );

  --修改房屋状态
  procedure update_house_status(p_house_id          in number,
                                p_house_status_code in varchar2);

  --通过code和code_value获取code_value_name
  function get_code_value_name(p_code       in varchar2,
                               p_code_value in varchar2) return varchar2;

  --通过code获取省名
  function get_province_name(p_province_code in varchar2) return varchar2;

  --通过city_code获取市名
  function get_city_name(p_city_code in varchar2) return varchar2;

  --通过user_id获取user_name
  function get_user_name(p_user_id in number) return varchar2;

  --根据province_code，city_code和house_detail整合具体地址
  function get_address(p_province_code in varchar2,
                       p_city_code     in varchar2,
                       p_house_detail  in varchar2) return varchar2;

  --生成入住人员编号：RZRY+年+月+流水号（4位）
  function get_new_check_in_staff_code return varchar2;

  --插入人员信息
  procedure insert_new_staff(p_job_number         in varchar2, --人员工号
                             p_staff_name         in varchar2, --姓名
                             p_sex_code           in varchar2, --性别code
                             p_department_code    in varchar2, --所在部门code
                             p_base_location_code in varchar2, --base地code
                             p_tel                in varchar2, --联系电话
                             p_email_address      in varchar2, --邮箱地址
                             p_remark             in varchar2, --备注
                             p_user_id            number);

  --更新人员信息
  procedure update_staff(p_check_in_staff_id    in number, --id主键
                         p_staff_code           in varchar2, --人员编号
                         p_job_number           in varchar2, --人员工号
                         p_staff_name           in varchar2, --姓名
                         p_sex_code             in varchar2, --性别code
                         p_department_code      in varchar2, --所在部门code
                         p_base_location_code   in varchar2, --base地code
                         p_tel                  in varchar2, --联系电话
                         p_check_in_status_code in varchar2, --入住状态code
                         p_email_address        in varchar2, --邮箱地址
                         p_remark               in varchar2, --备注
                         p_user_id              in number);

  --修改人员入住状态
  procedure update_staff_check_in_status(p_check_in_staff_id    in number,
                                         p_check_in_status_code in varchar2,
                                         p_user_id              in number);

  --生成合同编码：FWHT+年+月+流水号（4位）
  FUNCTION get_contract_number(p_document_type     VARCHAR2,
                               p_company_id        NUMBER,
                               p_operation_unit_id NUMBER,
                               p_operation_date    DATE,
                               p_created_by        NUMBER) RETURN VARCHAR2;

  --插入合同信息
  procedure insert_new_contract(p_contract_code      in varchar2, --房屋合同编号
                                p_start_date         in date, --合同开始日
                                p_end_date           in date, --合同到期日
                                p_house_id           in number, --房屋id
                                p_month_rent_fee     in number, --月租金
                                p_rent_period        in number, --租期
                                p_agency_fee         in number, --中介费
                                p_invoice_tax        in number, --发票税费
                                p_total_fee          in number, --总金额
                                p_currency_type_code in varchar2, --币种code
                                p_rent_remark        in varchar2, --租金信息备注
                                p_contract_remark    in varchar2, --合同备注
                                p_user_id            in number);

  --合同确认
  procedure confirm_contract(p_contract_id in number, p_user_id in number);

  --合同修改
  procedure update_contract(p_contract_id        in number,
                            p_start_date         in date,
                            p_end_date           in date,
                            p_house_id           in number,
                            p_month_rent_fee     in number,
                            p_rent_period        in number,
                            p_agency_fee         in number,
                            p_invoice_tax        in number,
                            p_total_fee          in number,
                            p_currency_type_code in varchar2,
                            p_rent_remark        in varchar2,
                            p_contract_remark    in varchar2,
                            p_user_id            in number);

  --插入入住过程记录
  procedure insert_new_rent_process_record(p_contract_id             number, --合同id
                                           p_staff_id                number, --入住人员id
                                           p_expected_living_to_date date, --预计入住时间至
                                           p_user_id                 number);

end hrms_pkg;
/
create or replace package body hrms_pkg is

  --生成房屋编码：FW+年+月+流水号（4位）
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

  --生成房屋编码：FW+年+月+流水号（4位）
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

  --插入房屋信息
  procedure insert_new_house(p_house_abbreviation   in varchar2, --房屋简称
                             p_house_type_code      in varchar2, --房屋类型code
                             p_bed_number_code      in varchar2, --床位code
                             p_house_area_code      in varchar2, --房屋面积code
                             p_house_status_code    in varchar2, --房屋状态code
                             p_house_province_code  in varchar2, --省code
                             p_house_city_code      in varchar2, --市code
                             p_house_detail         in varchar2, --详细地址
                             p_intermediary_name    in varchar2, --中介名称
                             p_intermediary_contact in varchar2, --中介联系人
                             p_intermediary_tel     in varchar2, --中介联系电话
                             p_landlord_name        in varchar2, --房东姓名
                             p_landlord_tel         in varchar2, --房东联系电话
                             p_house_remark         in varchar2, --备注
                             p_user_id              in number --操作者
                             ) is
    v_house_id   number := hrms_house_id_sequence.nextval; --id
    v_date       date := sysdate; --操作日期
    v_house_code varchar2(30) := hrms_pkg.get_house_number(p_document_type     => null,
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

  --通过code和code_value获取code_value_name
  function get_code_value_name(p_code       in varchar2,
                               p_code_value in varchar2) return varchar2 is
    v_code_value_name varchar2(30) := '';
  begin
    if (p_code is null or p_code = '') or
       (p_code_value is null or p_code_value = '') then
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

  --通过province_code获取省名
  function get_province_name(p_province_code in varchar2) return varchar2 is
    v_province_name varchar2(30) := '';
  begin
    if p_province_code is null or p_province_code = '' then
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

  --通过city_code获取市名
  function get_city_name(p_city_code in varchar2) return varchar2 is
    v_city_name varchar2(30) := '';
  begin
    if p_city_code is null or p_city_code = '' then
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

  --通过user_id获取user_name
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

  --根据province_code，city_code和house_detail整合具体地址
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

  --更新房屋信息
  procedure update_house(p_house_id             in number, --id主键
                         p_house_abbreviation   in varchar2, --房屋简称
                         p_house_type_code      in varchar2, --房屋类型code
                         p_bed_number_code      in varchar2, --床位code
                         p_house_area_code      in varchar2, --房屋面积code
                         p_house_status_code    in varchar2, --房屋状态code
                         p_house_province_code  in varchar2, --省code
                         p_house_city_code      in varchar2, --市code
                         p_house_detail         in varchar2, --详细地址
                         p_intermediary_name    in varchar2, --中介名称
                         p_intermediary_contact in varchar2, --中介联系人
                         p_intermediary_tel     in varchar2, --中介联系电话
                         p_landlord_name        in varchar2, --房东姓名
                         p_landlord_tel         in varchar2, --房东联系电话
                         p_house_remark         in varchar2, --备注
                         p_user_id              in number --操作者
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

  --修改房屋状态
  procedure update_house_status(p_house_id          in number,
                                p_house_status_code in varchar2) is
  begin
    update hrms_house
       set house_status_code = p_house_status_code
     where house_id = p_house_id;
  end update_house_status;

  --生成入住人员编号：RZRY+年+月+流水号（4位）
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

  --插入人员信息
  procedure insert_new_staff(p_job_number         in varchar2, --人员工号
                             p_staff_name         in varchar2, --姓名
                             p_sex_code           in varchar2, --性别code
                             p_department_code    in varchar2, --所在部门code
                             p_base_location_code in varchar2, --base地code
                             p_tel                in varchar2, --联系电话
                             p_email_address      in varchar2, --邮箱地址
                             p_remark             in varchar2, --备注
                             p_user_id            number) is
    v_check_in_staff_id    number; --id主键
    v_staff_code           varchar2(30); --人员编号
    v_check_in_status_code varchar2(30); --入住状态code
    v_date_now             date; --操作时间
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

  --更新人员信息
  procedure update_staff(p_check_in_staff_id    in number, --id主键
                         p_staff_code           in varchar2, --人员编号
                         p_job_number           in varchar2, --人员工号
                         p_staff_name           in varchar2, --姓名
                         p_sex_code             in varchar2, --性别code
                         p_department_code      in varchar2, --所在部门code
                         p_base_location_code   in varchar2, --base地code
                         p_tel                  in varchar2, --联系电话
                         p_check_in_status_code in varchar2, --入住状态code
                         p_email_address        in varchar2, --邮箱地址
                         p_remark               in varchar2, --备注
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

  --修改人员入住状态
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

  --生成合同编码：FWHT+年+月+流水号（4位）
  FUNCTION get_contract_number(p_document_type     VARCHAR2,
                               p_company_id        NUMBER,
                               p_operation_unit_id NUMBER,
                               p_operation_date    DATE,
                               p_created_by        NUMBER) RETURN VARCHAR2 IS
    c_coding_usage_code CONSTANT VARCHAR2(30) := '53';
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
  END get_contract_number;

  --插入合同信息
  procedure insert_new_contract(p_contract_code      in varchar2, --房屋合同编号
                                p_start_date         in date, --合同开始日
                                p_end_date           in date, --合同到期日
                                p_house_id           in number, --房屋id
                                p_month_rent_fee     in number, --月租金
                                p_rent_period        in number, --租期
                                p_agency_fee         in number, --中介费
                                p_invoice_tax        in number, --发票税费
                                p_total_fee          in number, --总金额
                                p_currency_type_code in varchar2, --币种code
                                p_rent_remark        in varchar2, --租金信息备注
                                p_contract_remark    in varchar2, --合同备注
                                p_user_id            in number) is
    v_date_now             date := sysdate;
    v_contract_id          number := hrms_contract_S.Nextval;
    v_contract_status_code varchar2(30) := 'CREATION';
  begin
    insert into hrms_contract
      (contract_id,
       contract_code,
       start_date,
       end_date,
       house_id,
       month_rent_fee,
       rent_period,
       agency_fee,
       invoice_tax,
       total_fee,
       currency_type_code,
       rent_remark,
       contract_remark,
       contract_status_code,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_contract_id,
       p_contract_code,
       p_start_date,
       p_end_date,
       p_house_id,
       p_month_rent_fee,
       p_rent_period,
       p_agency_fee,
       p_invoice_tax,
       p_total_fee,
       p_currency_type_code,
       p_rent_remark,
       p_contract_remark,
       v_contract_status_code,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
    hrms_pkg.update_house_status(p_house_id          => p_house_id,
                                 p_house_status_code => 'ALREADY_RENTED');
    dbms_output.put_line(sql%rowcount);
  end insert_new_contract;

  --合同确认
  procedure confirm_contract(p_contract_id in number, p_user_id in number) is
    v_date_now  date := sysdate;
    v_total_day number;
  begin
    select (round(to_number(end_date - start_date)) + 1)
      into v_total_day
      from hrms_contract
     where contract_id = p_contract_id;
    update hrms_contract
       set contract_status_code = 'CONFIRM',
           confirm_date         = v_date_now,
           day_rent_fee         = total_fee / v_total_day,
           last_updated_by      = p_user_id,
           last_updated_date    = v_date_now
     where contract_id = p_contract_id
       and contract_status_code = 'CREATION';
  end confirm_contract;

  --合同修改
  procedure update_contract(p_contract_id        in number,
                            p_start_date         in date,
                            p_end_date           in date,
                            p_house_id           in number,
                            p_month_rent_fee     in number,
                            p_rent_period        in number,
                            p_agency_fee         in number,
                            p_invoice_tax        in number,
                            p_total_fee          in number,
                            p_currency_type_code in varchar2,
                            p_rent_remark        in varchar2,
                            p_contract_remark    in varchar2,
                            p_user_id            in number) is
    v_date_now     date := sysdate;
    v_old_house_id number;
  begin
    select house_id
      into v_old_house_id
      from hrms_contract
     where contract_id = p_contract_id;
    --将原来的房屋状态改回FREE
    if v_old_house_id <> p_house_id then
      hrms_pkg.update_house_status(p_house_id          => v_old_house_id,
                                   p_house_status_code => 'FREE');
    end if;
    update hrms_contract
       set start_date         = p_start_date,
           end_date           = p_end_date,
           house_id           = p_house_id,
           month_rent_fee     = p_month_rent_fee,
           rent_period        = p_rent_period,
           agency_fee         = p_agency_fee,
           invoice_tax        = p_invoice_tax,
           total_fee          = p_total_fee,
           currency_type_code = p_currency_type_code,
           rent_remark        = p_rent_remark,
           contract_remark    = p_contract_remark,
           last_updated_by    = p_user_id,
           last_updated_date  = v_date_now
     where contract_id = p_contract_id;
    --将现在的房屋状态改为
    hrms_pkg.update_house_status(p_house_id          => p_house_id,
                                 p_house_status_code => 'ALREADY_RENTED');
  
  end update_contract;
  
  --入住，床位-1
  --procedure check_in()
  
  --退房，床位+1
  --procedure check_out()

  --插入入住过程记录
  procedure insert_new_rent_process_record(p_contract_id             number, --合同id
                                           p_staff_id                number, --入住人员id
                                           p_expected_living_to_date date, --预计入住时间至
                                           p_user_id                 number) is
    v_date_now               date := sysdate;
    v_rent_process_record_id number := rent_process_record_S.Nextval;
    v_check_in_status_code   varchar2(30);
  begin
    select check_in_status_code
      into v_check_in_status_code
      from hrms_check_in_staff
     where check_in_staff_id = p_staff_id;
    if v_check_in_status_code <> 'CHECKED_IN' then
      insert into rent_process_record
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
      hrms_pkg.update_staff_check_in_status(p_check_in_staff_id    => p_staff_id,
                                            p_check_in_status_code => 'CHECKED_IN',
                                            p_user_id              => p_user_id);
    end if;
  end insert_new_rent_process_record;

end hrms_pkg;
/
