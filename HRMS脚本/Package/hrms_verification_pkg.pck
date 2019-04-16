create or replace package hrms_verification_pkg is

  -- Author  : WU
  -- Created : 2019/4/7 11:45:05
  -- Purpose : ��������

  --���ɺ�����ţ�SKHX+��+��+��+��ˮ�ţ�4λ��
  FUNCTION get_verification_number(p_document_type     VARCHAR2,
                                   p_company_id        NUMBER,
                                   p_operation_unit_id NUMBER,
                                   p_operation_date    DATE,
                                   p_created_by        NUMBER)
    RETURN VARCHAR2;

  --����
  procedure insert_new_verification(p_receipt_id               in number, --�տid
                                    p_total_fee                in number, --�ܺ������
                                    p_contract_id              in number, --��ͬid
                                    p_staff_id                 in number, --��ס��Աid
                                    p_electricity_fee_this     in number, --�������
                                    p_network_fee_this         in number, --��������
                                    p_rent_fee_this            in number, --��������
                                    p_tv_fee_this              in number, --�������ӷ�
                                    p_water_fee_this           in number, --����ˮ��
                                    p_verification_code        in varchar2, --�������
                                    p_contract_code            in varchar2, --��ͬ���
                                    p_verification_source_code in varchar2, --��Դ����code 
                                    p_receipt_code             in varchar2, --�տ���
                                    p_currency_code            in varchar2, --����code
                                    p_verification_remark      in varchar2, --������ע
                                    p_user_id                  in number);

end hrms_verification_pkg;
/
create or replace package body hrms_verification_pkg is

  --���ɺ�����ţ�SKHX+��+��+��+��ˮ�ţ�4λ��
  FUNCTION get_verification_number(p_document_type     VARCHAR2,
                                   p_company_id        NUMBER,
                                   p_operation_unit_id NUMBER,
                                   p_operation_date    DATE,
                                   p_created_by        NUMBER)
    RETURN VARCHAR2 IS
    c_coding_usage_code CONSTANT VARCHAR2(30) := '56';
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
  END get_verification_number;

  --����
  procedure insert_new_verification(p_receipt_id               in number, --�տid
                                    p_total_fee                in number, --�ܺ������
                                    p_contract_id              in number, --��ͬid
                                    p_staff_id                 in number, --��ס��Աid
                                    p_electricity_fee_this     in number, --�������
                                    p_network_fee_this         in number, --��������
                                    p_rent_fee_this            in number, --��������
                                    p_tv_fee_this              in number, --�������ӷ�
                                    p_water_fee_this           in number, --����ˮ��
                                    p_verification_code        in varchar2, --�������
                                    p_contract_code            in varchar2, --��ͬ���
                                    p_verification_source_code in varchar2, --��Դ����code 
                                    p_receipt_code             in varchar2, --�տ���
                                    p_currency_code            in varchar2, --����code
                                    p_verification_remark      in varchar2, --������ע
                                    p_user_id                  in number) is
    v_date_now                  date := sysdate;
    v_hrms_verification_id      number := hrms_verification_S.Nextval;
    v_total_verification_amount number := 0;
  begin
    --�����ܺ������
    if p_electricity_fee_this is not null and p_electricity_fee_this > 0 then
      v_total_verification_amount := v_total_verification_amount +
                                     p_electricity_fee_this;
    end if;
    if p_network_fee_this is not null and p_network_fee_this > 0 then
      v_total_verification_amount := v_total_verification_amount +
                                     p_network_fee_this;
    end if;
    if p_rent_fee_this is not null and p_rent_fee_this > 0 then
      v_total_verification_amount := v_total_verification_amount +
                                     p_rent_fee_this;
    end if;
    if p_tv_fee_this is not null and p_tv_fee_this > 0 then
      v_total_verification_amount := v_total_verification_amount +
                                     p_tv_fee_this;
    end if;
    if p_water_fee_this is not null and p_water_fee_this > 0 then
      v_total_verification_amount := v_total_verification_amount +
                                     p_water_fee_this;
    end if;
    if v_total_verification_amount <= 0 then
      --��û�к�����ֱ���˳�
      return;
    end if;
    --�����տ��
    update hrms_receipt
       set write_off_amount  = write_off_amount + p_total_fee,
           last_updated_by   = p_user_id,
           last_updated_date = v_date_now
     where receipt_id = p_receipt_id;
    --��������
    insert into hrms_verification
      (verification_id,
       verification_code,
       contract_code,
       verification_source_code,
       total_verification_amount,
       staff_id,
       receipt_code,
       currency_code,
       remark,
       created_by,
       creation_date,
       last_updated_by,
       last_updated_date)
    values
      (v_hrms_verification_id,
       p_verification_code,
       p_contract_code,
       p_verification_source_code,
       v_total_verification_amount,
       p_staff_id,
       p_receipt_code,
       p_currency_code,
       p_verification_remark,
       p_user_id,
       v_date_now,
       p_user_id,
       v_date_now);
    --���·���ծȨ������������ϸ
    --���
    if p_electricity_fee_this is not null and p_electricity_fee_this > 0 then
      update hrms_fee_claim
         set electricity_fee_remain = electricity_fee_remain -
                                      p_electricity_fee_this,
             last_updated_by        = p_user_id,
             last_updated_date      = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
      insert into hrms_verification_detail
        (verification_detail_id,
         verification_id,
         bond_item_code,
         verification_amount,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_verification_detail_S.Nextval,
         v_hrms_verification_id,
         'ELECTRICITY _FEE',
         p_electricity_fee_this,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
    --����
    if p_network_fee_this is not null and p_network_fee_this > 0 then
      update hrms_fee_claim
         set network_fee_remain = network_fee_remain - p_network_fee_this,
             last_updated_by    = p_user_id,
             last_updated_date  = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
      insert into hrms_verification_detail
        (verification_detail_id,
         verification_id,
         bond_item_code,
         verification_amount,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_verification_detail_S.Nextval,
         v_hrms_verification_id,
         'NETWORK_FEE',
         p_network_fee_this,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
    --����
    if p_rent_fee_this is not null and p_rent_fee_this > 0 then
      update hrms_fee_claim
         set rent_fee_remain   = rent_fee_remain - p_rent_fee_this,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
      insert into hrms_verification_detail
        (verification_detail_id,
         verification_id,
         bond_item_code,
         verification_amount,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_verification_detail_S.Nextval,
         v_hrms_verification_id,
         'RENT_FEE',
         p_rent_fee_this,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
    --���ӷ�
    if p_tv_fee_this is not null and p_tv_fee_this > 0 then
      update hrms_fee_claim
         set tv_fee_remain     = tv_fee_remain - p_tv_fee_this,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
      insert into hrms_verification_detail
        (verification_detail_id,
         verification_id,
         bond_item_code,
         verification_amount,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_verification_detail_S.Nextval,
         v_hrms_verification_id,
         'TV_FEE',
         p_tv_fee_this,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
    --ˮ��
    if p_water_fee_this is not null and p_water_fee_this > 0 then
      update hrms_fee_claim
         set water_fee_remain  = water_fee_remain - p_water_fee_this,
             last_updated_by   = p_user_id,
             last_updated_date = v_date_now
       where contract_id = p_contract_id
         and staff_id = p_staff_id;
      insert into hrms_verification_detail
        (verification_detail_id,
         verification_id,
         bond_item_code,
         verification_amount,
         created_by,
         creation_date,
         last_updated_by,
         last_updated_date)
      values
        (hrms_verification_detail_S.Nextval,
         v_hrms_verification_id,
         'WATER_FEE',
         p_water_fee_this,
         p_user_id,
         v_date_now,
         p_user_id,
         v_date_now);
    end if;
  end insert_new_verification;

end hrms_verification_pkg;
/
