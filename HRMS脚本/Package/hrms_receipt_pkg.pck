create or replace package hrms_receipt_pkg is

  -- Author  : WU
  -- Created : 2019/4/3 13:39:04
  -- Purpose : 收款单

  --生成收款单编码：SKXZ+年+月+日+流水号（4位）
  FUNCTION get_receipt_number(p_document_type     VARCHAR2,
                              p_company_id        NUMBER,
                              p_operation_unit_id NUMBER,
                              p_operation_date    DATE,
                              p_created_by        NUMBER) RETURN VARCHAR2;

  --插入收款单
  procedure insert_new_receipt(p_receipt_code        varchar2, --收款编号
                               p_receipt_source_code varchar2, --收款来源code
                               p_staff_id            number, --收款对象（人员id）
                               p_receipt_method_code varchar2, --收款方式code
                               p_receipt_amount      number, --收款金额
                               p_currency_code       varchar2, --币种code
                               p_remark              varchar2, --备注
                               p_user_id             number);

end hrms_receipt_pkg;
/
create or replace package body hrms_receipt_pkg is

  --生成收款单编码：SKXZ+年+月+日+流水号（4位）
  FUNCTION get_receipt_number(p_document_type     VARCHAR2,
                              p_company_id        NUMBER,
                              p_operation_unit_id NUMBER,
                              p_operation_date    DATE,
                              p_created_by        NUMBER) RETURN VARCHAR2 IS
    c_coding_usage_code CONSTANT VARCHAR2(30) := '55';
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
  END get_receipt_number;

  --插入收款单
  procedure insert_new_receipt(p_receipt_code        varchar2, --收款编号
                               p_receipt_source_code varchar2, --收款来源code
                               p_staff_id            number, --收款对象（人员id）
                               p_receipt_method_code varchar2, --收款方式code
                               p_receipt_amount      number, --收款金额
                               p_currency_code       varchar2, --币种code
                               p_remark              varchar2, --备注
                               p_user_id             number) is
    v_receipt_id number := hrms_receipt_S.Nextval;
    v_date_now   date := sysdate;
  begin
    insert into hrms_receipt
      (receipt_id,
       receipt_code,
       receipt_source_code,
       staff_id,
       receipt_method_code,
       receipt_amount,
       write_off_amount,
       currency_code,
       remark,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_receipt_id,
       p_receipt_code,
       p_receipt_source_code,
       p_staff_id,
       p_receipt_method_code,
       p_receipt_amount,
       0,
       p_currency_code,
       p_remark,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
  end insert_new_receipt;

end hrms_receipt_pkg;
/
