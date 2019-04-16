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



--创建房屋信息表
create table hrms_house(
             house_id               number,                   --id主键
             house_code             varchar2(30),             --房屋编号
             house_abbreviation     varchar2(30),             --房屋简称
             house_type_code        varchar2(30),             --房屋类型code
             bed_number_code        varchar2(30),             --床位code
             house_area_code        varchar2(30),             --房屋面积code
             house_status_code      varchar2(30),             --房屋状态code
             house_province_code    varchar2(30),             --省code
             house_city_code        varchar2(30),             --市code
             house_detail           varchar2(50),             --详细地址
             intermediary_name      varchar2(30),             --中介名称
             intermediary_contact   varchar2(30),             --中介联系人
             intermediary_tel       varchar2(13),             --中介联系电话
             landlord_name          varchar2(30),             --房东姓名
             landlord_tel           varchar2(13),             --房东联系电话
             house_remark           varchar2(1000),           --备注
             living_person          number,                   --入住人数
             rest_bed               number,                   --剩余床位
             created_by             number not null,          --创建者
             creation_date          date not null,            --创建日期
             last_updated_by        number not null,          --最后更新者
             last_updated_date      date not null             --最后更新时间
);

select house_id,
       house_abbreviation,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --床位
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --房屋面积
       landlord_name,
       landlord_tel,
       intermediary_name,
       intermediary_contact,
       intermediary_tel,
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --省名
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --市名
       house_detail, --详细地址
       house_remark
  from hrms_house
  


--主键约束
alter table hrms_house add constraint hrms_house_pk primary key (house_id)

--添加注释
comment on table hrms_house is '房屋信息表';
comment on column hrms_house.house_id is 'id主键';
comment on column hrms_house.house_code is '房屋编号';
comment on column hrms_house.house_abbreviation is '房屋简称';
comment on column hrms_house.house_type_code is '房屋类型code';
comment on column hrms_house.bed_number_code is '床位code';
comment on column hrms_house.house_area_code is '房屋面积code';
comment on column hrms_house.house_status_code is '房屋状态code';
comment on column hrms_house.house_province_code is '省code';
comment on column hrms_house.house_city_code is '市code';
comment on column hrms_house.house_detail is '详细地址';
comment on column hrms_house.intermediary_name is '中介名称';
comment on column hrms_house.intermediary_contact is '中介联系人';
comment on column hrms_house.intermediary_tel is '中介联系电话';
comment on column hrms_house.landlord_name is '房东姓名';
comment on column hrms_house.landlord_tel is '房东联系电话';
comment on column hrms_house.house_remark is '备注';
comment on column hrms_house.living_person is '入住人数';
comment on column hrms_house.rest_bed is '剩余床位';
comment on column hrms_house.created_by is '创建者';
comment on column hrms_house.created_date is '创建日期';
comment on column hrms_house.last_updated_by is '最后更新者';
comment on column hrms_house.last_updated_date is '最后更新时间';

--创建索引
create unique index hrms_house_u1 on hrms_house(house_code);

--创建序列
create sequence hrms_house_id_sequence increment by 1 start with 1; --id自增序列
create sequence hrms_house_code_sequence increment by 1 start with 1; --code自增序列

--查询
select house_id, --id
       house_code, --房屋编号
       house_abbreviation, --房屋简称
       house_type_code, --房屋类型code
       bed_number_code, --床位code
       house_area_code, --房屋面积code
       house_status_code, --房屋状态code
       house_province_code as province_code, --省code
       house_city_code as city_code, --市code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --房屋类型
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --床位
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --房屋面积
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_STATUS',
                                    p_code_value => house_status_code) as house_status, --房屋状态
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --省名
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --市名
       house_detail, --详细地址
       hrms_pkg.get_address(p_province_code => house_province_code,
                            p_city_code     => house_city_code,
                            p_house_detail  => house_detail) as house_address, --房屋地址
       intermediary_name, --中介名称
       intermediary_contact, --中介联系人
       intermediary_tel, --中介联系电话
       landlord_name, --房东姓名
       landlord_tel, --房东联系电话
       to_char(creation_date, 'yyyy-mm-dd') as house_create_date, --创建日期
       house_remark, --备注
       hrms_pkg.get_user_name(p_user_id => created_by) as created_by_name, --创建者名称
       to_char(creation_date, 'yyyy-mm-dd') as created_date, --创建日期
       hrms_pkg.get_user_name(p_user_id => last_updated_by) as last_updated_by_name, --最后更新者姓名
       to_char(last_updated_date, 'yyyy-mm-dd') as last_updated_date --最后更新时间

  from hrms_house
  

--入住人员信息表
create table hrms_check_in_staff(
             check_in_staff_id      number not null,  --id主键
             staff_code             varchar2(30),     --人员编号
             job_number             varchar2(30),     --人员工号
             staff_name             varchar2(30),     --姓名
             sex_code               varchar2(30),     --性别code
             department_code        varchar2(30),     --所在部门code
             base_location_code     varchar2(30),     --base地code
             tel                    varchar2(13),     --联系电话
             check_in_status_code   varchar2(30),     --入住状态code
             email_address          varchar2(30),     --邮箱地址
             remark                 varchar2(1000),   --备注
             created_by             number not null,  --创建者
             creation_date          date not null,    --创建日期
             last_updated_by        number not null,  --最后更新者
             last_updated_date      date not null     --最后更新时间
);

select check_in_staff_id, --id主键
       staff_code, --人员编号
       job_number, --人员工号
       staff_name, --姓名
       sex_code, --性别code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                    p_code_value => sex_code) as sex, --性别
       department_code, --所在部门code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --所在部门
       base_location_code, --base地code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base地
       tel, --联系电话
       check_in_status_code, --入住状态code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CHECK_IN_STATUS',
                                    p_code_value => check_in_status_code) as check_in_status, --入住状态
       email_address, --邮箱地址
       remark, --备注
       to_char(creation_date,'yyyy-mm-dd') as creation_date --创建日期
  from hrms_check_in_staff



--添加注释
comment on table hrms_check_in_staff is '入住人员信息表';
comment on column hrms_check_in_staff.check_in_staff_id is 'id主键';
comment on column hrms_check_in_staff.staff_code is '人员编号';
comment on column hrms_check_in_staff.job_number is '人员工号';
comment on column hrms_check_in_staff.staff_name is '姓名';
comment on column hrms_check_in_staff.sex_code is '性别code';
comment on column hrms_check_in_staff.department_code is '所在部门code';
comment on column hrms_check_in_staff.base_location_code is 'base地code';
comment on column hrms_check_in_staff.tel is '联系电话';
comment on column hrms_check_in_staff.check_in_status_code is '入住状态code';
comment on column hrms_check_in_staff.email_address is '邮箱地址';
comment on column hrms_check_in_staff.remark is '备注';
comment on column hrms_check_in_staff.created_by is '创建者';
comment on column hrms_check_in_staff.creation_date is '创建日期';
comment on column hrms_check_in_staff.last_updated_by is '最后更新者';
comment on column hrms_check_in_staff.last_updated_date is '最后更新时间';

--主键约束
alter table hrms_check_in_staff add constraint hrms_check_in_staff_pk primary key (check_in_staff_id)

--创建索引
create unique index hrms_check_in_staff_u1 on hrms_check_in_staff(staff_code);

--创建序列
create sequence hrms_check_in_staff_S increment by 1 start with 1; --id主键自增序列
create sequence hrms_staff_code_S increment by 1 start with 1; --code自增序列


--租房合同表
create table hrms_contract(
       contract_id                number not null,     --id主键
       contract_code              varchar2(30),        --房屋合同编号
       start_date                 date,                --合同开始日
       end_date                   date,                --合同到期日
       house_id                   number,              --房屋id
       month_rent_fee             number,              --月租金
       rent_period                number,              --租期
       agency_fee                 number,              --中介费
       invoice_tax                number,              --发票税费
       total_fee                  number,              --总金额
       currency_type_code         varchar2(30),        --币种code
       rent_remark                varchar2(1000),      --租金信息备注
       contract_remark            varchar2(1000),      --合同备注
       contract_status_code       varchar2(30),        --合同状态code
       confirm_date               date,                --确认日期
       day_rent_fee               number,              --日租金
       created_by                 number not null,     --创建者
       creation_date              date not null,       --创建日期
       last_updated_by            number not null,     --最后更新者
       last_updated_date          date not null        --最后更新时间
);

--主键约束
alter table hrms_contract add constraint hrms_contract_pk primary key (contract_id);

--创建索引
create unique index hrms_contract_u1 on hrms_contract(contract_code);

--创建序列
create sequence hrms_contract_S increment by 1 start with 1; --id主键自增序列
create sequence contract_code_S increment by 1 start with 1; --code自增序列

--添加注释
comment on table hrms_contract is '租房合同表';
comment on column hrms_contract.contract_id is 'id主键';
comment on column hrms_contract.contract_code is '房屋合同编号';
comment on column hrms_contract.start_date is '合同开始日';
comment on column hrms_contract.end_date is '合同到期日';
comment on column hrms_contract.house_id is '房屋id';
comment on column hrms_contract.month_rent_fee is '月租金';
comment on column hrms_contract.rent_period is '租期';
comment on column hrms_contract.agency_fee is '中介费';
comment on column hrms_contract.invoice_tax is '发票税费';
comment on column hrms_contract.total_fee is '总金额';
comment on column hrms_contract.currency_type_code is '币种code';
comment on column hrms_contract.rent_remark is '租金信息备注';
comment on column hrms_contract.contract_remark is '合同备注';
comment on column hrms_contract.contract_status_code is '合同状态code';
comment on column hrms_contract.confirm_date is '确认日期';
comment on column hrms_contract.day_rent_fee is '日租金';
comment on column hrms_contract.created_by is '创建者';
comment on column hrms_contract.creation_date is '创建日期';
comment on column hrms_contract.last_updated_by is '最后更新者';
comment on column hrms_contract.last_updated_date is '最后更新时间';


select contract_id, --id主键
       contract_code, --房屋合同编号
       to_char(start_date, 'yyyy-mm-dd') as start_date, --合同开始日
       to_char(end_date, 'yyyy-mm-dd') as end_date, --合同到期日
       house_abbreviation, --房屋简称
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --房屋类型
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --床位
       living_person, --入住人数
       rest_bed, --剩余床位
       landlord_name, --房东姓名
       landlord_tel, --房东联系电话
       intermediary_name, --中介名称
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CONTRACT_STATUS',
                                    p_code_value => contract_status_code) as contract_status, --租房合同状态
       contract_status_code,        --合同状态code
       contract_remark --合同备注
  from hrms_house, hrms_contract
 where hrms_house.house_id = hrms_contract.house_id
    
 
select contract_id, --id主键
       contract_code, --房屋合同编号
       to_char(start_date, 'yyyy-mm-dd') as start_date, --合同开始日
       to_char(end_date, 'yyyy-mm-dd') as end_date, --合同到期日
       hrms_house.house_id as house_id, --房屋id
       month_rent_fee, --月租金
       rent_period, --租期
       agency_fee, --中介费
       invoice_tax, --发票税费
       total_fee, --总金额
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CURRENCY_TYPE',
                                    p_code_value => currency_type_code) as currency_type, --币种
       rent_remark, --租金信息备注
       contract_remark, --合同备注
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CONTRACT_STATUS',
                                    p_code_value => contract_status_code) as contract_status, --合同状态
       
       house_abbreviation, --房屋简称
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --房屋类型
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BED_NUMBER',
                                    p_code_value => bed_number_code) as bed_number, --床位
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_AREA',
                                    p_code_value => house_area_code) as house_area, --房屋面积
       hrms_pkg.get_province_name(p_province_code => house_province_code) as province, --省名
       hrms_pkg.get_city_name(p_city_code => house_city_code) as city, --市名
       house_detail, --详细地址
       intermediary_name, --中介名称
       intermediary_contact, --中介联系人
       intermediary_tel, --中介联系电话
       landlord_name, --房东姓名
       landlord_tel, --房东联系电话
       house_remark --房屋备注
  from hrms_house, hrms_contract
 where hrms_house.house_id = hrms_contract.house_id
      

--入住过程记录
create table hrms_rent_process_record(rent_process_record_id       number,                   --id主键
                                       contract_id                  number,                  --合同id
                                       staff_id                     number,                  --入住人员id
                                       check_in_date                date,                    --入住日期
                                       expected_living_to_date      date,                    --预计入住时间至
                                       check_out_date               date,                    --退房日期
                                       total_living_day             number,                  --总入住天数
                                       created_by                   number not null,         --创建者
                                       creation_date                date not null,           --创建日期
                                       last_updated_by              number not null,         --最后更新者
                                       last_updated_date            date not null            --最后更新时间
);

--主键约束
alter table hrms_rent_process_record add constraint hrms_rent_process_record_pk primary key (rent_process_record_id);

--创建序列
create sequence rent_process_record_S increment by 1 start with 1; --id主键自增序列

--添加注释
comment on table hrms_rent_process_record is '入住过程记录';
comment on column hrms_rent_process_record.rent_process_record_id is 'id主键';
comment on column hrms_rent_process_record.contract_id is '合同id';
comment on column hrms_rent_process_record.staff_id is '入住人员id';
comment on column hrms_rent_process_record.check_in_date is '入住日期';
comment on column hrms_rent_process_record.expected_living_to_date is '预计入住时间至';
comment on column hrms_rent_process_record.check_out_date is '退房日期';
comment on column hrms_rent_process_record.total_living_day is '总入住天数';
comment on column hrms_rent_process_record.created_by is '创建者';
comment on column hrms_rent_process_record.creation_date is '创建日期';
comment on column hrms_rent_process_record.last_updated_by is '最后更新者';
comment on column hrms_rent_process_record.last_updated_date is '最后更新时间';


select check_in_staff_id,
       job_number,
       staff_name,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_SEX',
                                    p_code_value => sex_code) as sex, --性别
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --所在部门
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base地
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
                                    p_code_value => sex_code) as sex, --性别
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                    p_code_value => department_code) as department, --所在部门
       base_location_code, --base地code
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                    p_code_value => base_location_code) as base_location, --base地
       tel,
       house_abbreviation,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_HOUSE_TYPE',
                                    p_code_value => house_type_code) as house_type, --房屋类型
       to_char(check_in_date,'yyyy-mm-dd') as check_in_date,
       ceil((sysdate-check_in_date)+1) as living_day,
       check_in_status_code,
       hrms_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_CHECK_IN_STATUS',
                                    p_code_value => check_in_status_code) as check_in_status --入住状态
from rent_process_record,hrms_check_in_staff,hrms_contract,hrms_house
where rent_process_record.contract_id=hrms_contract.contract_id
and rent_process_record.staff_id=hrms_check_in_staff.check_in_staff_id
and hrms_house.house_id=hrms_contract.house_id

--费用信息表
create table hrms_fee(
       fee_id                 number,               --主键id
       fee_code               varchar2(30),         --费用单编号
       start_date             date,                 --费用开始日
       end_date               date,                 --费用结束日
       fee_item_code          varchar2(30),         --费用项目code
       fee_source_code        varchar2(30),         --费用来源code
       fee_house_id           number,               --费用对象（房屋id）
       fee_cost               number,               --费用金额
       currency_code          varchar2(30),         --币种code
       remark                 varchar2(1000),       --备注
       created_by             number not null,      --创建者
       creation_date          date not null,        --创建日期
       last_updated_by        number not null,      --最后更新者
       last_updated_date      date not null         --最后更新时间
);

--主键约束
alter table hrms_fee add constraint hrms_fee_pk primary key (fee_id);

--创建序列
create sequence hrms_fee_S increment by 1 start with 1; --id主键自增序列

--创建索引
create unique index hrms_fee_u1 on hrms_fee(fee_code);

--添加注释
comment on table hrms_fee is '费用单';
comment on column hrms_fee.fee_id is 'id主键';
comment on column hrms_fee.fee_code is '费用单编号';
comment on column hrms_fee.start_date is '费用开始日';
comment on column hrms_fee.end_date is '费用结束日';
comment on column hrms_fee.fee_item_code is '费用项目code';
comment on column hrms_fee.fee_source_code is '费用来源code';
comment on column hrms_fee.fee_house_id is '费用对象（房屋id）';
comment on column hrms_fee.fee_cost is '费用金额';
comment on column hrms_fee.currency_code is '币种code';
comment on column hrms_fee.remark is '备注';
comment on column hrms_fee.created_by is '创建者';
comment on column hrms_fee.creation_date is '创建日期';
comment on column hrms_fee.last_updated_by is '最后更新者';
comment on column hrms_fee.last_updated_date is '最后更新时间';

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
 
 
--费用明细表
create table hrms_fee_detail(
       fee_detail_id         number,                   --id主键
       fee_id                number,                   --费用单id
       staff_id              number,                   --人员id
       apportion_fee         number,                   --分摊费用
       created_by            number not null,          --创建者
       creation_date         date not null,            --创建日期
       last_updated_by       number not null,          --最后更新者
       last_updated_date     date not null             --最后更新时间
);

--添加注释
comment on table hrms_fee_detail is '费用明细表';
comment on column hrms_fee_detail.fee_detail_id is 'id主键';
comment on column hrms_fee_detail.fee_id is '费用单id';
comment on column hrms_fee_detail.staff_id is '人员id';
comment on column hrms_fee_detail.apportion_fee is '分摊费用';
comment on column hrms_fee_detail.created_by is '创建者';
comment on column hrms_fee_detail.creation_date is '创建日期';
comment on column hrms_fee_detail.last_updated_by is '最后更新者';
comment on column hrms_fee_detail.last_updated_date is '最后更新时间';


--主键约束
alter table hrms_fee_detail add constraint hrms_fee_detail_pk primary key (fee_detail_id);

--创建序列
create sequence hrms_fee_detail_S increment by 1 start with 1; --id主键自增序列


--收款单表
create table hrms_receipt(
       receipt_id            number,              --id主键
       receipt_code          varchar2(30),        --收款编号
       receipt_source_code   varchar2(30),        --收款来源code
       staff_id              number,              --收款对象（人员id）
       receipt_method_code   varchar2(30),        --收款方式code
       receipt_amount        number,              --收款金额
       write_off_amount      number,              --核销金额
       currency_code         varchar2(30),        --币种code
       remark                varchar2(1000),      --备注
       created_by            number not null,     --创建者
       creation_date         date not null,       --创建日期
       last_updated_by       number not null,     --最后更新者
       last_updated_date     date not null        --最后更新时间
);

--添加注释
comment on table hrms_receipt is '收款单表';
comment on column hrms_receipt.receipt_id is 'id主键';
comment on column hrms_receipt.receipt_code is '收款编号';
comment on column hrms_receipt.receipt_source_code is '收款来源code';
comment on column hrms_receipt.staff_id is '收款对象（人员id）';
comment on column hrms_receipt.receipt_method_code is '收款方式code';
comment on column hrms_receipt.receipt_amount is '收款金额';
comment on column hrms_receipt.write_off_amount is '核销金额';
comment on column hrms_receipt.currency_code is '币种code';
comment on column hrms_receipt.remark is '备注';
comment on column hrms_receipt.created_by is '创建者';
comment on column hrms_receipt.creation_date is '创建日期';
comment on column hrms_receipt.last_updated_by is '最后更新者';
comment on column hrms_receipt.last_updated_date is '最后更新时间';


--主键约束
alter table hrms_receipt add constraint hrms_receipt_pk primary key (receipt_id);

--创建序列
create sequence hrms_receipt_S increment by 1 start with 1; --id主键自增序列

--创建索引
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
       

--核销表
create table hrms_verification(
       verification_id                    number,                         --id主键
       verification_code                  varchar2(30),                   --核销编号
       contract_code                      varchar2(30),                   --合同编号
       verification_source_code           varchar2(30),                   --来源类别code
       total_verification_amount          number,                         --核销总金额
       staff_id                           number,                         --来源对象（人员id）
       receipt_code                       varchar2(30),                   --来源单号（收款编号）
       currency_code                      varchar2(30),                   --币种code
       remark                             varchar2(1000),                 --备注
       created_by                         number not null,                --创建者
       creation_date                      date not null,                  --创建日期
       last_updated_by                    number not null,                --最后更新者
       last_updated_date                  date not null                   --最后更新时间
);

alter table hrms_verification drop (bond_item_code);
alter table hrms_verification drop (verification_amount);
alter table hrms_verification add (total_verification_amount number);



--添加注释
comment on table hrms_verification is '核销表';
comment on column hrms_verification.verification_id is 'id主键';
comment on column hrms_verification.verification_code is '核销编号';
comment on column hrms_verification.contract_code is '合同编号';
comment on column hrms_verification.bond_item_code is '债券项code';
comment on column hrms_verification.verification_amount is '核销金额';
comment on column hrms_verification.verification_source_code is '来源类别code';
comment on column hrms_verification.staff_id is '来源对象（人员id）';
comment on column hrms_verification.receipt_code is '来源单号（收款编号）';
comment on column hrms_verification.currency_code is '币种code';
comment on column hrms_verification.remark is '备注';
comment on column hrms_verification.created_by is '创建者';
comment on column hrms_verification.creation_date is '创建日期';
comment on column hrms_verification.last_updated_by is '最后更新者';
comment on column hrms_verification.last_updated_date is '最后更新时间';


--主键约束
alter table hrms_verification add constraint hrms_verification_pk primary key (verification_id);

--创建序列
create sequence hrms_verification_S increment by 1 start with 1; --id主键自增序列

--创建索引
create unique index hrms_verification_u1 on hrms_verification(verification_code);


--核销明细表
create table hrms_verification_detail(
       verification_detail_id       number,              --id主键
       verification_id              number,              --核销表id
       bond_item_code               varchar2(30),        --债券项code
       verification_amount          number,              --核销金额
       created_by                   number not null,     --创建者
       creation_date                date not null,       --创建日期
       last_updated_by              number not null,     --最后更新者
       last_updated_date            date not null        --最后更新时间
);

--添加注释
comment on table hrms_verification_detail is '核销明细表';
comment on column hrms_verification_detail.verification_detail_id is 'id主键';
comment on column hrms_verification_detail.verification_id is '核销表id';
comment on column hrms_verification_detail.bond_item_code is '债券项code';
comment on column hrms_verification_detail.verification_amount is '核销金额';
comment on column hrms_verification_detail.created_by is '创建者';
comment on column hrms_verification_detail.creation_date is '创建日期';
comment on column hrms_verification_detail.last_updated_by is '最后更新者';
comment on column hrms_verification_detail.last_updated_date is '最后更新时间';


--主键约束
alter table hrms_verification_detail add constraint hrms_verification_detail_pk primary key (verification_detail_id);

--创建序列
create sequence hrms_verification_detail_S increment by 1 start with 1; --id主键自增序列

--费用债权表
create table hrms_fee_claim(
       fee_claim_id                      number,              --id主键
       contract_id                       number,              --合同id
       staff_id                          number,              --入住员工id
       rent_fee_remain                   number,              --房租剩余债权
       electricity_fee_remain            number,              --电费剩余债权
       water_fee_remain                  number,              --水费剩余债权
       network_fee_remain                number,              --网费剩余债权
       tv_fee_remain                     number,              --电视费剩余债权
       rent_fee_total                    number,              --总房租
       electricity_fee_total             number,              --总电费
       water_fee_total                   number,              --总水费
       network_fee_total                 number,              --总网费
       tv_fee_total                      number,              --总电视费
       remark                            varchar2(1000),      --备注
       created_by                        number not null,     --创建者
       creation_date                     date not null,       --创建日期
       last_updated_by                   number not null,     --最后更新者
       last_updated_date                 date not null        --最后更新时间
);

--添加注释
comment on table hrms_fee_claim is '费用债权表';
comment on column hrms_fee_claim.fee_claim_id is 'id主键';
comment on column hrms_fee_claim.contract_id is '合同id';
comment on column hrms_fee_claim.staff_id is '入住员工id';
comment on column hrms_fee_claim.rent_fee_remain is '房租剩余债权';
comment on column hrms_fee_claim.electricity_fee_remain is '电费剩余债权';
comment on column hrms_fee_claim.water_fee_remain is '水费剩余债权';
comment on column hrms_fee_claim.network_fee_remain is '网费剩余债权';
comment on column hrms_fee_claim.tv_fee_remain is '电视费剩余债权';
comment on column hrms_fee_claim.rent_fee_total is '总房租';
comment on column hrms_fee_claim.electricity_fee_total is '总电费';
comment on column hrms_fee_claim.water_fee_total is '总水费';
comment on column hrms_fee_claim.network_fee_total is '总网费';
comment on column hrms_fee_claim.tv_fee_total is '总电视费';
comment on column hrms_fee_claim.remark is '备注';
comment on column hrms_fee_claim.created_by is '创建者';
comment on column hrms_fee_claim.creation_date is '创建日期';
comment on column hrms_fee_claim.last_updated_by is '最后更新者';
comment on column hrms_fee_claim.last_updated_date is '最后更新时间';


drop table hrms_fee_claim;

--主键约束
alter table hrms_fee_claim add constraint hrms_fee_claim_pk primary key (fee_claim_id);

--创建序列
create sequence hrms_fee_claim_S increment by 1 start with 1; --id主键自增序列



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
                                          p_code_value => sex_code) as sex, --性别
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_DEPARTMENT',
                                          p_code_value => department_code) as department, --所在部门
       hrms_house_pkg.get_code_value_name(p_code       => 'HRMS_CODING_VALUE_BASE_LOCATION',
                                          p_code_value => base_location_code) as base_location, --base地
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


 
 
