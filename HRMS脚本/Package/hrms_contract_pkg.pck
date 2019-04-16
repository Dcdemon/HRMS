create or replace package hrms_contract_pkg is

  -- Author  : WU
  -- Created : 2019/4/1 20:27:05
  -- Purpose : 房屋合同

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

end hrms_contract_pkg;
/
create or replace package body hrms_contract_pkg is

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
    hrms_house_pkg.update_house_status(p_house_id          => p_house_id,
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
      hrms_house_pkg.update_house_status(p_house_id          => v_old_house_id,
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
    hrms_house_pkg.update_house_status(p_house_id          => p_house_id,
                                 p_house_status_code => 'ALREADY_RENTED');
  
  end update_contract;
end hrms_contract_pkg;
/
