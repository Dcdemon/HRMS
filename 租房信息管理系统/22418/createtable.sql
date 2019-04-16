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

--��ס���̼�¼
create table rent_process_record(rent_process_record_id       number,                  --id����
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
alter table rent_process_record add constraint rent_process_record_pk primary key (rent_process_record_id);

--��������
create sequence rent_process_record_S increment by 1 start with 1; --id������������

--���ע��
comment on table rent_process_record is '��ס���̼�¼';
comment on column rent_process_record.rent_process_record_id is 'id����';
comment on column rent_process_record.contract_id is '��ͬid';
comment on column rent_process_record.staff_id is '��ס��Աid';
comment on column rent_process_record.check_in_date is '��ס����';
comment on column rent_process_record.expected_living_to_date is 'Ԥ����סʱ����';
comment on column rent_process_record.check_out_date is '�˷�����';
comment on column rent_process_record.total_living_day is '����ס����';
comment on column rent_process_record.created_by is '������';
comment on column rent_process_record.creation_date is '��������';
comment on column rent_process_record.last_updated_by is '��������';
comment on column rent_process_record.last_updated_date is '������ʱ��';