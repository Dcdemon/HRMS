delete from hrms_house;
delete from hrms_check_in_staff;
delete from hrms_contract;
delete from hrms_rent_process_record;
delete from hrms_fee;
delete from hrms_fee_detail;
delete from hrms_receipt;
delete from hrms_verification;
delete from hrms_verification_detail;
delete from hrms_fee_claim;



--����������Ϣ��
create table hrms_house(
             house_id               number,                   --id����
             house_code             varchar2(30),             --���ݱ��
             house_abbreviation     varchar2(30),             --���ݼ��
             house_type_code        varchar2(30),             --��������code
             bed_number_code        varchar2(30),             --��λcode
             house_area_code        varchar2(30),             --�������code
             house_status_code      varchar2(30),             --����״̬code
             house_province_code    varchar2(30),             --ʡcode
             house_city_code        varchar2(30),             --��code
             house_detail           varchar2(50),             --��ϸ��ַ
             intermediary_name      varchar2(30),             --�н�����
             intermediary_contact   varchar2(30),             --�н���ϵ��
             intermediary_tel       varchar2(13),             --�н���ϵ�绰
             landlord_name          varchar2(30),             --��������
             landlord_tel           varchar2(13),             --������ϵ�绰
             house_remark           varchar2(1000),           --��ע
             living_person          number,                   --��ס����
             rest_bed               number,                   --ʣ�ലλ
             created_by             number not null,          --������
             creation_date          date not null,            --��������
             last_updated_by        number not null,          --��������
             last_updated_date      date not null             --������ʱ��
);

select house_id,
       house_abbreviation,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --��λ
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --�������
       landlord_name,
       landlord_tel,
       intermediary_name,
       intermediary_contact,
       intermediary_tel,
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --ʡ��
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --����
       house_detail, --��ϸ��ַ
       house_remark
  from hrms_house
  


--����Լ��
alter table hrms_house add constraint hrms_house_pk primary key (house_id)

--���ע��
comment on table hrms_house is '������Ϣ��';
comment on column hrms_house.house_id is 'id����';
comment on column hrms_house.house_code is '���ݱ��';
comment on column hrms_house.house_abbreviation is '���ݼ��';
comment on column hrms_house.house_type_code is '��������code';
comment on column hrms_house.bed_number_code is '��λcode';
comment on column hrms_house.house_area_code is '�������code';
comment on column hrms_house.house_status_code is '����״̬code';
comment on column hrms_house.house_province_code is 'ʡcode';
comment on column hrms_house.house_city_code is '��code';
comment on column hrms_house.house_detail is '��ϸ��ַ';
comment on column hrms_house.intermediary_name is '�н�����';
comment on column hrms_house.intermediary_contact is '�н���ϵ��';
comment on column hrms_house.intermediary_tel is '�н���ϵ�绰';
comment on column hrms_house.landlord_name is '��������';
comment on column hrms_house.landlord_tel is '������ϵ�绰';
comment on column hrms_house.house_remark is '��ע';
comment on column hrms_house.living_person is '��ס����';
comment on column hrms_house.rest_bed is 'ʣ�ലλ';
comment on column hrms_house.created_by is '������';
comment on column hrms_house.created_date is '��������';
comment on column hrms_house.last_updated_by is '��������';
comment on column hrms_house.last_updated_date is '������ʱ��';

--��������
create unique index hrms_house_u1 on hrms_house(house_code);

--��������
create sequence hrms_house_id_sequence increment by 1 start with 1; --id��������
create sequence hrms_house_code_sequence increment by 1 start with 1; --code��������

--��ѯ
select house_id, --id
       house_code, --���ݱ��
       house_abbreviation, --���ݼ��
       house_type_code, --��������code
       bed_number_code, --��λcode
       house_area_code, --�������code
       house_status_code, --����״̬code
       house_province_code as province_code, --ʡcode
       house_city_code as city_code, --��code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --��������
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --��λ
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --�������
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_STATUS',
                                    p_code_value => house_status_code) as house_status, --����״̬
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --ʡ��
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --����
       house_detail, --��ϸ��ַ
       hrms_pkg.get_address(p_province_code => house_province_code,
                            p_city_code     => house_city_code,
                            p_house_detail  => house_detail) as house_address, --���ݵ�ַ
       intermediary_name, --�н�����
       intermediary_contact, --�н���ϵ��
       intermediary_tel, --�н���ϵ�绰
       landlord_name, --��������
       landlord_tel, --������ϵ�绰
       to_char(creation_date, 'yyyy-mm-dd') as house_create_date, --��������
       house_remark, --��ע
       hrms_pkg.get_user_name(p_user_id => created_by) as created_by_name, --����������
       to_char(creation_date, 'yyyy-mm-dd') as created_date, --��������
       hrms_pkg.get_user_name(p_user_id => last_updated_by) as last_updated_by_name, --������������
       to_char(last_updated_date, 'yyyy-mm-dd') as last_updated_date --������ʱ��

  from hrms_house
  

--��ס��Ա��Ϣ��
create table hrms_check_in_staff(
             check_in_staff_id      number not null,  --id����
             staff_code             varchar2(30),     --��Ա���
             job_number             varchar2(30),     --��Ա����
             staff_name             varchar2(30),     --����
             sex_code               varchar2(30),     --�Ա�code
             department_code        varchar2(30),     --���ڲ���code
             base_location_code     varchar2(30),     --base��code
             tel                    varchar2(13),     --��ϵ�绰
             check_in_status_code   varchar2(30),     --��ס״̬code
             email_address          varchar2(30),     --�����ַ
             remark                 varchar2(1000),   --��ע
             created_by             number not null,  --������
             creation_date          date not null,    --��������
             last_updated_by        number not null,  --��������
             last_updated_date      date not null     --������ʱ��
);

select check_in_staff_id, --id����
       staff_code, --��Ա���
       job_number, --��Ա����
       staff_name, --����
       sex_code, --�Ա�code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                    p_code_value => sex_code) as sex, --�Ա�
       department_code, --���ڲ���code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --���ڲ���
       base_location_code, --base��code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base��
       tel, --��ϵ�绰
       check_in_status_code, --��ס״̬code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CHECK_IN_STATUS',
                                    p_code_value => check_in_status_code) as check_in_status, --��ס״̬
       email_address, --�����ַ
       remark, --��ע
       to_char(creation_date,'yyyy-mm-dd') as creation_date --��������
  from hrms_check_in_staff



--���ע��
comment on table hrms_check_in_staff is '��ס��Ա��Ϣ��';
comment on column hrms_check_in_staff.check_in_staff_id is 'id����';
comment on column hrms_check_in_staff.staff_code is '��Ա���';
comment on column hrms_check_in_staff.job_number is '��Ա����';
comment on column hrms_check_in_staff.staff_name is '����';
comment on column hrms_check_in_staff.sex_code is '�Ա�code';
comment on column hrms_check_in_staff.department_code is '���ڲ���code';
comment on column hrms_check_in_staff.base_location_code is 'base��code';
comment on column hrms_check_in_staff.tel is '��ϵ�绰';
comment on column hrms_check_in_staff.check_in_status_code is '��ס״̬code';
comment on column hrms_check_in_staff.email_address is '�����ַ';
comment on column hrms_check_in_staff.remark is '��ע';
comment on column hrms_check_in_staff.created_by is '������';
comment on column hrms_check_in_staff.creation_date is '��������';
comment on column hrms_check_in_staff.last_updated_by is '��������';
comment on column hrms_check_in_staff.last_updated_date is '������ʱ��';

--����Լ��
alter table hrms_check_in_staff add constraint hrms_check_in_staff_pk primary key (check_in_staff_id)

--��������
create unique index hrms_check_in_staff_u1 on hrms_check_in_staff(staff_code);

--��������
create sequence hrms_check_in_staff_S increment by 1 start with 1; --id������������
create sequence hrms_staff_code_S increment by 1 start with 1; --code��������


--�ⷿ��ͬ��
create table hrms_contract(
       contract_id                number not null,     --id����
       contract_code              varchar2(30),        --���ݺ�ͬ���
       start_date                 date,                --��ͬ��ʼ��
       end_date                   date,                --��ͬ������
       house_id                   number,              --����id
       month_rent_fee             number,              --�����
       rent_period                number,              --����
       agency_fee                 number,              --�н��
       invoice_tax                number,              --��Ʊ˰��
       total_fee                  number,              --�ܽ��
       currency_type_code         varchar2(30),        --����code
       rent_remark                varchar2(1000),      --�����Ϣ��ע
       contract_remark            varchar2(1000),      --��ͬ��ע
       contract_status_code       varchar2(30),        --��ͬ״̬code
       confirm_date               date,                --ȷ������
       day_rent_fee               number,              --�����
       created_by                 number not null,     --������
       creation_date              date not null,       --��������
       last_updated_by            number not null,     --��������
       last_updated_date          date not null        --������ʱ��
);

--����Լ��
alter table hrms_contract add constraint hrms_contract_pk primary key (contract_id);

--��������
create unique index hrms_contract_u1 on hrms_contract(contract_code);

--��������
create sequence hrms_contract_S increment by 1 start with 1; --id������������
create sequence contract_code_S increment by 1 start with 1; --code��������

--���ע��
comment on table hrms_contract is '�ⷿ��ͬ��';
comment on column hrms_contract.contract_id is 'id����';
comment on column hrms_contract.contract_code is '���ݺ�ͬ���';
comment on column hrms_contract.start_date is '��ͬ��ʼ��';
comment on column hrms_contract.end_date is '��ͬ������';
comment on column hrms_contract.house_id is '����id';
comment on column hrms_contract.month_rent_fee is '�����';
comment on column hrms_contract.rent_period is '����';
comment on column hrms_contract.agency_fee is '�н��';
comment on column hrms_contract.invoice_tax is '��Ʊ˰��';
comment on column hrms_contract.total_fee is '�ܽ��';
comment on column hrms_contract.currency_type_code is '����code';
comment on column hrms_contract.rent_remark is '�����Ϣ��ע';
comment on column hrms_contract.contract_remark is '��ͬ��ע';
comment on column hrms_contract.contract_status_code is '��ͬ״̬code';
comment on column hrms_contract.confirm_date is 'ȷ������';
comment on column hrms_contract.day_rent_fee is '�����';
comment on column hrms_contract.created_by is '������';
comment on column hrms_contract.creation_date is '��������';
comment on column hrms_contract.last_updated_by is '��������';
comment on column hrms_contract.last_updated_date is '������ʱ��';


select contract_id, --id����
       contract_code, --���ݺ�ͬ���
       to_char(start_date, 'yyyy-mm-dd') as start_date, --��ͬ��ʼ��
       to_char(end_date, 'yyyy-mm-dd') as end_date, --��ͬ������
       house_abbreviation, --���ݼ��
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --��������
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --��λ
       living_person, --��ס����
       rest_bed, --ʣ�ലλ
       landlord_name, --��������
       landlord_tel, --������ϵ�绰
       intermediary_name, --�н�����
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CONTRACT_STATUS',
                                    p_code_value => contract_status_code) as contract_status, --�ⷿ��ͬ״̬
       contract_status_code,        --��ͬ״̬code
       contract_remark --��ͬ��ע
  from hrms_house, hrms_contract
 where hrms_house.house_id = hrms_contract.house_id
    
 
select contract_id, --id����
       contract_code, --���ݺ�ͬ���
       to_char(start_date, 'yyyy-mm-dd') as start_date, --��ͬ��ʼ��
       to_char(end_date, 'yyyy-mm-dd') as end_date, --��ͬ������
       hrms_house.house_id as house_id, --����id
       month_rent_fee, --�����
       rent_period, --����
       agency_fee, --�н��
       invoice_tax, --��Ʊ˰��
       total_fee, --�ܽ��
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CURRENCY_TYPE',
                                    p_code_value => currency_type_code) as currency_type, --����
       rent_remark, --�����Ϣ��ע
       contract_remark, --��ͬ��ע
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CONTRACT_STATUS',
                                    p_code_value => contract_status_code) as contract_status, --��ͬ״̬
       
       house_abbreviation, --���ݼ��
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --��������
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --��λ
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --�������
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --ʡ��
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --����
       house_detail, --��ϸ��ַ
       intermediary_name, --�н�����
       intermediary_contact, --�н���ϵ��
       intermediary_tel, --�н���ϵ�绰
       landlord_name, --��������
       landlord_tel, --������ϵ�绰
       house_remark --���ݱ�ע
  from hrms_house, hrms_contract
 where hrms_house.house_id = hrms_contract.house_id
      

--��ס���̼�¼
create table hrms_rent_process_record(rent_process_record_id       number,                   --id����
                                       contract_id                  number,                  --��ͬid
                                       staff_id                     number,                  --��ס��Աid
                                       check_in_date                date,                    --��ס����
                                       expected_living_to_date      date,                    --Ԥ����סʱ����
                                       check_out_date               date,                    --�˷�����
                                       total_living_day             number,                  --����ס����
                                       created_by                   number not null,         --������
                                       creation_date                date not null,           --��������
                                       last_updated_by              number not null,         --��������
                                       last_updated_date            date not null            --������ʱ��
);

--����Լ��
alter table hrms_rent_process_record add constraint hrms_rent_process_record_pk primary key (rent_process_record_id);

--��������
create sequence rent_process_record_S increment by 1 start with 1; --id������������

--���ע��
comment on table hrms_rent_process_record is '��ס���̼�¼';
comment on column hrms_rent_process_record.rent_process_record_id is 'id����';
comment on column hrms_rent_process_record.contract_id is '��ͬid';
comment on column hrms_rent_process_record.staff_id is '��ס��Աid';
comment on column hrms_rent_process_record.check_in_date is '��ס����';
comment on column hrms_rent_process_record.expected_living_to_date is 'Ԥ����סʱ����';
comment on column hrms_rent_process_record.check_out_date is '�˷�����';
comment on column hrms_rent_process_record.total_living_day is '����ס����';
comment on column hrms_rent_process_record.created_by is '������';
comment on column hrms_rent_process_record.creation_date is '��������';
comment on column hrms_rent_process_record.last_updated_by is '��������';
comment on column hrms_rent_process_record.last_updated_date is '������ʱ��';


select check_in_staff_id,
       job_number,
       staff_name,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                    p_code_value => sex_code) as sex, --�Ա�
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --���ڲ���
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base��
       tel,
       email_address,
       check_in_status_code
  from hrms_check_in_staff
  where check_in_status_code!='CHECKED_IN'
  

select rent_process_record_id,
       rent_process_record.contract_id as contract_id,
       rent_process_record.staff_id as check_in_staff_id,
       contract_code,
       job_number,
       staff_name,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                    p_code_value => sex_code) as sex, --�Ա�
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --���ڲ���
       base_location_code, --base��code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base��
       tel,
       house_abbreviation,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --��������
       to_char(check_in_date,'yyyy-mm-dd') as check_in_date,
       ceil((sysdate-check_in_date)+1) as living_day,
       check_in_status_code,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CHECK_IN_STATUS',
                                    p_code_value => check_in_status_code) as check_in_status --��ס״̬
from rent_process_record,hrms_check_in_staff,hrms_contract,hrms_house
where rent_process_record.contract_id=hrms_contract.contract_id
and rent_process_record.staff_id=hrms_check_in_staff.check_in_staff_id
and hrms_house.house_id=hrms_contract.house_id

--������Ϣ��
create table hrms_fee(
       fee_id                 number,               --����id
       fee_code               varchar2(30),         --���õ����
       start_date             date,                 --���ÿ�ʼ��
       end_date               date,                 --���ý�����
       fee_item_code          varchar2(30),         --������Ŀcode
       fee_source_code        varchar2(30),         --������Դcode
       fee_house_id           number,               --���ö��󣨷���id��
       fee_cost               number,               --���ý��
       currency_code          varchar2(30),         --����code
       remark                 varchar2(1000),       --��ע
       created_by             number not null,      --������
       creation_date          date not null,        --��������
       last_updated_by        number not null,      --��������
       last_updated_date      date not null         --������ʱ��
);

--����Լ��
alter table hrms_fee add constraint hrms_fee_pk primary key (fee_id);

--��������
create sequence hrms_fee_S increment by 1 start with 1; --id������������

--��������
create unique index hrms_fee_u1 on hrms_fee(fee_code);

--���ע��
comment on table hrms_fee is '���õ�';
comment on column hrms_fee.fee_id is 'id����';
comment on column hrms_fee.fee_code is '���õ����';
comment on column hrms_fee.start_date is '���ÿ�ʼ��';
comment on column hrms_fee.end_date is '���ý�����';
comment on column hrms_fee.fee_item_code is '������Ŀcode';
comment on column hrms_fee.fee_source_code is '������Դcode';
comment on column hrms_fee.fee_house_id is '���ö��󣨷���id��';
comment on column hrms_fee.fee_cost is '���ý��';
comment on column hrms_fee.currency_code is '����code';
comment on column hrms_fee.remark is '��ע';
comment on column hrms_fee.created_by is '������';
comment on column hrms_fee.creation_date is '��������';
comment on column hrms_fee.last_updated_by is '��������';
comment on column hrms_fee.last_updated_date is '������ʱ��';

select hrms_fee_pkg.get_fee_number(p_document_type     => null,
                                   p_company_id        => 150,
                                   p_operation_unit_id => null,
                                   p_operation_date    => sysdate,
                                   p_created_by        => 2) as fee_code,
       to_char(sysdate, 'yyyy-mm-dd') as creation_date,
       trunc(add_months(trunc(sysdate), -1), 'mm') as start_date,
       last_day(add_months(trunc(sysdate), -1)) as end_date
  from dual

select fee_id,
       fee_house_id,
       fee_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_FEE_ITEM',
                                          p_code_value => fee_item_code) as fee_item,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_FEE_SOURCE',
                                          p_code_value => fee_source_code) as fee_source,
       house_abbreviation,
       start_date,
       end_date,
       fee_cost,
       hrms_fee.creation_date
  from hrms_fee, hrms_house
 where hrms_fee.fee_house_id = hrms_house.house_id
 
 
--������ϸ��
create table hrms_fee_detail(
       fee_detail_id         number,                   --id����
       fee_id                number,                   --���õ�id
       staff_id              number,                   --��Աid
       apportion_fee         number,                   --��̯����
       created_by            number not null,          --������
       creation_date         date not null,            --��������
       last_updated_by       number not null,          --��������
       last_updated_date     date not null             --������ʱ��
);

--���ע��
comment on table hrms_fee_detail is '������ϸ��';
comment on column hrms_fee_detail.fee_detail_id is 'id����';
comment on column hrms_fee_detail.fee_id is '���õ�id';
comment on column hrms_fee_detail.staff_id is '��Աid';
comment on column hrms_fee_detail.apportion_fee is '��̯����';
comment on column hrms_fee_detail.created_by is '������';
comment on column hrms_fee_detail.creation_date is '��������';
comment on column hrms_fee_detail.last_updated_by is '��������';
comment on column hrms_fee_detail.last_updated_date is '������ʱ��';


--����Լ��
alter table hrms_fee_detail add constraint hrms_fee_detail_pk primary key (fee_detail_id);

--��������
create sequence hrms_fee_detail_S increment by 1 start with 1; --id������������


--�տ��
create table hrms_receipt(
       receipt_id            number,              --id����
       receipt_code          varchar2(30),        --�տ���
       receipt_source_code   varchar2(30),        --�տ���Դcode
       staff_id              number,              --�տ������Աid��
       receipt_method_code   varchar2(30),        --�տʽcode
       receipt_amount        number,              --�տ���
       write_off_amount      number,              --�������
       currency_code         varchar2(30),        --����code
       remark                varchar2(1000),      --��ע
       created_by            number not null,     --������
       creation_date         date not null,       --��������
       last_updated_by       number not null,     --��������
       last_updated_date     date not null        --������ʱ��
);

--���ע��
comment on table hrms_receipt is '�տ��';
comment on column hrms_receipt.receipt_id is 'id����';
comment on column hrms_receipt.receipt_code is '�տ���';
comment on column hrms_receipt.receipt_source_code is '�տ���Դcode';
comment on column hrms_receipt.staff_id is '�տ������Աid��';
comment on column hrms_receipt.receipt_method_code is '�տʽcode';
comment on column hrms_receipt.receipt_amount is '�տ���';
comment on column hrms_receipt.write_off_amount is '�������';
comment on column hrms_receipt.currency_code is '����code';
comment on column hrms_receipt.remark is '��ע';
comment on column hrms_receipt.created_by is '������';
comment on column hrms_receipt.creation_date is '��������';
comment on column hrms_receipt.last_updated_by is '��������';
comment on column hrms_receipt.last_updated_date is '������ʱ��';


--����Լ��
alter table hrms_receipt add constraint hrms_receipt_pk primary key (receipt_id);

--��������
create sequence hrms_receipt_S increment by 1 start with 1; --id������������

--��������
create unique index hrms_receipt_u1 on hrms_receipt(receipt_code);

select hrms_receipt_pkg.get_receipt_number(p_document_type     => null,
                                           p_company_id        => 150,
                                           p_operation_unit_id => null,
                                           p_operation_date    => sysdate,
                                           p_created_by        => 2) as receipt_code
  from dual;
  

select receipt_id,
       staff_id,
       receipt_code,
       hrms_receipt.creation_date,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_RECEIPT_SOURCE',
                                          p_code_value => receipt_source_code) as receipt_source,
       staff_name,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_RECEIPT_METHOD',
                                          p_code_value => receipt_method_code)  as receipt_method,
       receipt_amount,
       write_off_amount,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CURRENCY_TYPE',
                                          p_code_value => currency_code)  as currency,
       hrms_receipt.remark
from hrms_receipt,hrms_check_in_staff
where hrms_receipt.staff_id=hrms_check_in_staff.check_in_staff_id
       

--������
create table hrms_verification(
       verification_id                    number,                         --id����
       verification_code                  varchar2(30),                   --�������
       contract_code                      varchar2(30),                   --��ͬ���
       verification_source_code           varchar2(30),                   --��Դ���code
       total_verification_amount          number,                         --�����ܽ��
       staff_id                           number,                         --��Դ������Աid��
       receipt_code                       varchar2(30),                   --��Դ���ţ��տ��ţ�
       currency_code                      varchar2(30),                   --����code
       remark                             varchar2(1000),                 --��ע
       created_by                         number not null,                --������
       creation_date                      date not null,                  --��������
       last_updated_by                    number not null,                --��������
       last_updated_date                  date not null                   --������ʱ��
);

alter table hrms_verification drop (bond_item_code);
alter table hrms_verification drop (verification_amount);
alter table hrms_verification add (total_verification_amount number);



--���ע��
comment on table hrms_verification is '������';
comment on column hrms_verification.verification_id is 'id����';
comment on column hrms_verification.verification_code is '�������';
comment on column hrms_verification.contract_code is '��ͬ���';
comment on column hrms_verification.bond_item_code is 'ծȯ��code';
comment on column hrms_verification.verification_amount is '�������';
comment on column hrms_verification.verification_source_code is '��Դ���code';
comment on column hrms_verification.staff_id is '��Դ������Աid��';
comment on column hrms_verification.receipt_code is '��Դ���ţ��տ��ţ�';
comment on column hrms_verification.currency_code is '����code';
comment on column hrms_verification.remark is '��ע';
comment on column hrms_verification.created_by is '������';
comment on column hrms_verification.creation_date is '��������';
comment on column hrms_verification.last_updated_by is '��������';
comment on column hrms_verification.last_updated_date is '������ʱ��';


--����Լ��
alter table hrms_verification add constraint hrms_verification_pk primary key (verification_id);

--��������
create sequence hrms_verification_S increment by 1 start with 1; --id������������

--��������
create unique index hrms_verification_u1 on hrms_verification(verification_code);


--������ϸ��
create table hrms_verification_detail(
       verification_detail_id       number,              --id����
       verification_id              number,              --������id
       bond_item_code               varchar2(30),        --ծȯ��code
       verification_amount          number,              --�������
       created_by                   number not null,     --������
       creation_date                date not null,       --��������
       last_updated_by              number not null,     --��������
       last_updated_date            date not null        --������ʱ��
);

--���ע��
comment on table hrms_verification_detail is '������ϸ��';
comment on column hrms_verification_detail.verification_detail_id is 'id����';
comment on column hrms_verification_detail.verification_id is '������id';
comment on column hrms_verification_detail.bond_item_code is 'ծȯ��code';
comment on column hrms_verification_detail.verification_amount is '�������';
comment on column hrms_verification_detail.created_by is '������';
comment on column hrms_verification_detail.creation_date is '��������';
comment on column hrms_verification_detail.last_updated_by is '��������';
comment on column hrms_verification_detail.last_updated_date is '������ʱ��';


--����Լ��
alter table hrms_verification_detail add constraint hrms_verification_detail_pk primary key (verification_detail_id);

--��������
create sequence hrms_verification_detail_S increment by 1 start with 1; --id������������

--����ծȨ��
create table hrms_fee_claim(
       fee_claim_id                      number,              --id����
       contract_id                       number,              --��ͬid
       staff_id                          number,              --��סԱ��id
       rent_fee_remain                   number,              --����ʣ��ծȨ
       electricity_fee_remain            number,              --���ʣ��ծȨ
       water_fee_remain                  number,              --ˮ��ʣ��ծȨ
       network_fee_remain                number,              --����ʣ��ծȨ
       tv_fee_remain                     number,              --���ӷ�ʣ��ծȨ
       rent_fee_total                    number,              --�ܷ���
       electricity_fee_total             number,              --�ܵ��
       water_fee_total                   number,              --��ˮ��
       network_fee_total                 number,              --������
       tv_fee_total                      number,              --�ܵ��ӷ�
       remark                            varchar2(1000),      --��ע
       created_by                        number not null,     --������
       creation_date                     date not null,       --��������
       last_updated_by                   number not null,     --��������
       last_updated_date                 date not null        --������ʱ��
);

--���ע��
comment on table hrms_fee_claim is '����ծȨ��';
comment on column hrms_fee_claim.fee_claim_id is 'id����';
comment on column hrms_fee_claim.contract_id is '��ͬid';
comment on column hrms_fee_claim.staff_id is '��סԱ��id';
comment on column hrms_fee_claim.rent_fee_remain is '����ʣ��ծȨ';
comment on column hrms_fee_claim.electricity_fee_remain is '���ʣ��ծȨ';
comment on column hrms_fee_claim.water_fee_remain is 'ˮ��ʣ��ծȨ';
comment on column hrms_fee_claim.network_fee_remain is '����ʣ��ծȨ';
comment on column hrms_fee_claim.tv_fee_remain is '���ӷ�ʣ��ծȨ';
comment on column hrms_fee_claim.rent_fee_total is '�ܷ���';
comment on column hrms_fee_claim.electricity_fee_total is '�ܵ��';
comment on column hrms_fee_claim.water_fee_total is '��ˮ��';
comment on column hrms_fee_claim.network_fee_total is '������';
comment on column hrms_fee_claim.tv_fee_total is '�ܵ��ӷ�';
comment on column hrms_fee_claim.remark is '��ע';
comment on column hrms_fee_claim.created_by is '������';
comment on column hrms_fee_claim.creation_date is '��������';
comment on column hrms_fee_claim.last_updated_by is '��������';
comment on column hrms_fee_claim.last_updated_date is '������ʱ��';


drop table hrms_fee_claim;

--����Լ��
alter table hrms_fee_claim add constraint hrms_fee_claim_pk primary key (fee_claim_id);

--��������
create sequence hrms_fee_claim_S increment by 1 start with 1; --id������������



select hrms_contract.contract_id,
       hrms_contract.contract_code,
       hrms_fee.fee_id,
       hrms_fee.fee_item_code,
       hrms_fee_detail.staff_id,
       hrms_fee_detail.apportion_fee
  from hrms_house, hrms_contract, hrms_fee, hrms_fee_detail
 where hrms_contract.house_id = hrms_house.house_id
   and hrms_fee.fee_house_id = hrms_house.house_id
   and hrms_fee_detail.fee_id = hrms_fee.fee_id
   order by hrms_fee.fee_item_code
      
select check_in_staff_id,
       job_number,
       staff_name,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                          p_code_value => sex_code) as sex, --�Ա�
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                          p_code_value => department_code) as department, --���ڲ���
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                          p_code_value => base_location_code) as base_location, --base��
       tel,
       email_address,
       check_in_status_code
  from hrms_check_in_staff
  

select verification_id,
       hrms_verification.staff_id,
       verification_code,
       hrms_verification.creation_date,
       contract_code,
       bond_item_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_FEE_ITEM',
                                          p_code_value => bond_item_code) as bond_item,
       verification_amount,
       verification_source_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_RECEIPT_SOURCE',
                                          p_code_value => verification_source_code) as verification_source,
       staff_name,
       receipt_code,
       currency_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CURRENCY_TYPE',
                                          p_code_value => currency_code) as currency,
       hrms_verification.remark
  from hrms_verification, hrms_check_in_staff
 where hrms_verification.staff_id = hrms_check_in_staff.check_in_staff_id
          
    

select hrms_contract.contract_code,
       hrms_house.house_abbreviation,
       to_char(hrms_contract.start_date, 'yyyy-mm-dd') as start_date,
       to_char(hrms_contract.end_date, 'yyyy-mm-dd') as end_date,
       hrms_check_in_staff.job_number,
       hrms_check_in_staff.staff_name,
       hrms_check_in_staff.tel,
       to_char(hrms_rent_process_record.check_in_date, 'yyyy-mm-dd') as check_in_date,
       sum(hrms_receipt.receipt_amount) as receipt_amount,
       sum(hrms_receipt.write_off_amount) as write_off_amount
  from hrms_house,
       hrms_contract,
       hrms_check_in_staff,
       hrms_rent_process_record,
       hrms_receipt
 where hrms_house.house_id = hrms_contract.house_id
   and hrms_rent_process_record.contract_id = hrms_contract.contract_id
   and hrms_rent_process_record.staff_id = hrms_check_in_staff.check_in_staff_id
   and hrms_receipt.staff_id = hrms_check_in_staff.check_in_staff_id
 group by hrms_contract.contract_code,
          hrms_house.house_abbreviation,
          hrms_contract.start_date,
          hrms_contract.end_date,
          hrms_check_in_staff.job_number,
          hrms_check_in_staff.staff_name,
          hrms_check_in_staff.tel,
          hrms_rent_process_record.check_in_date
       

SELECT hrms_contract.contract_code,
       hrms_house.house_abbreviation,
       TO_CHAR(hrms_contract.start_date, 'yyyy-mm-dd') AS start_date,
       TO_CHAR(hrms_contract.end_date, 'yyyy-mm-dd') AS end_date,
       hrms_check_in_staff.job_number,
       hrms_check_in_staff.staff_name,
       hrms_check_in_staff.tel,
       TO_CHAR(hrms_rent_process_record.check_in_date, 'yyyy-mm-dd') AS check_in_date,
       SUM(hrms_receipt.receipt_amount) AS receipt_amount,
       SUM(hrms_receipt.write_off_amount) AS write_off_amount
  FROM hrms_house,
       hrms_contract,
       hrms_check_in_staff,
       hrms_rent_process_record,
       hrms_receipt
 WHERE hrms_house.house_id = hrms_contract.house_id
   AND hrms_rent_process_record.contract_id = hrms_contract.contract_id
   AND hrms_rent_process_record.staff_id =
       hrms_check_in_staff.check_in_staff_id
   and hrms_receipt.staff_id = hrms_check_in_staff.check_in_staff_id  
 GROUP BY hrms_contract.contract_code,
          hrms_house.house_abbreviation,
          hrms_contract.start_date,
          hrms_contract.end_date,
          hrms_check_in_staff.job_number,
          hrms_check_in_staff.staff_name,
          hrms_check_in_staff.tel,
          hrms_rent_process_record.check_in_date
          
select hrms_contract.contract_code,
       hrms_house.house_abbreviation,
       to_char(hrms_contract.start_date, 'yyyy-mm-dd') as start_date,
       to_char(hrms_contract.end_date, 'yyyy-mm-dd') as end_date,
       hrms_check_in_staff.job_number,
       hrms_check_in_staff.staff_name,
       hrms_check_in_staff.tel,
       to_char(hrms_rent_process_record.check_in_date, 'yyyy-mm-dd') as check_in_date,
       hrms_fee_claim.rent_fee_total,
       hrms_fee_claim.rent_fee_total - hrms_fee_claim.rent_fee_remain as rent_fee_done,
       hrms_fee_claim.electricity_fee_total,
       hrms_fee_claim.electricity_fee_total -
       hrms_fee_claim.electricity_fee_remain as electricity_fee_done,
       hrms_fee_claim.water_fee_total,
       hrms_fee_claim.water_fee_total - hrms_fee_claim.water_fee_remain as water_fee_done,
       hrms_fee_claim.tv_fee_total,
       hrms_fee_claim.tv_fee_total - hrms_fee_claim.tv_fee_remain as tv_fee_done,
       hrms_fee_claim.network_fee_total,
       hrms_fee_claim.network_fee_total - hrms_fee_claim.network_fee_remain as network_fee_done
  from hrms_contract,
       hrms_house,
       hrms_check_in_staff,
       hrms_rent_process_record,
       hrms_fee_claim
 where hrms_contract.house_id = hrms_house.house_id
   and hrms_rent_process_record.staff_id =hrms_check_in_staff.check_in_staff_id
   and hrms_rent_process_record.contract_id = hrms_contract.contract_id
   and hrms_fee_claim.contract_id = hrms_contract.contract_id
   and hrms_fee_claim.staff_id = hrms_check_in_staff.check_in_staff_id
          
    
select hrms_verification.verification_id,
       hrms_verification.staff_id,
       hrms_verification.verification_code,
       to_char(hrms_verification.creation_date, 'yyyy-mm-dd') as creation_date,
       hrms_verification.contract_code,
       hrms_verification_detail.bond_item_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_FEE_ITEM',
                                          p_code_value => hrms_verification_detail.bond_item_code) AS bond_item,
       hrms_verification_detail.verification_amount,
       hrms_verification.verification_source_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_RECEIPT_SOURCE',
                                          p_code_value => verification_source_code) AS verification_source,
       hrms_check_in_staff.staff_name,
       hrms_verification.receipt_code,
       hrms_verification.currency_code,
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CURRENCY_TYPE',
                                          p_code_value => currency_code) AS currency,
       hrms_verification.remark
  from hrms_verification, hrms_verification_detail, hrms_check_in_staff
 where hrms_verification.staff_id = hrms_check_in_staff.check_in_staff_id and hrms_verification_detail.verification_id = hrms_verification.verification_id



select hrms_house_pkg.get_house_number(p_document_type     => null,
                                       p_company_id        => 150,
                                       p_operation_unit_id => null,
                                       p_operation_date    => sysdate,
                                       p_created_by        => 2) as house_code
  from dual;


 
 
