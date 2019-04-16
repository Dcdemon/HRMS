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

--入住过程记录
create table rent_process_record(rent_process_record_id       number,                  --id主键
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
alter table rent_process_record add constraint rent_process_record_pk primary key (rent_process_record_id);

--创建序列
create sequence rent_process_record_S increment by 1 start with 1; --id主键自增序列

--添加注释
comment on table rent_process_record is '入住过程记录';
comment on column rent_process_record.rent_process_record_id is 'id主键';
comment on column rent_process_record.contract_id is '合同id';
comment on column rent_process_record.staff_id is '入住人员id';
comment on column rent_process_record.check_in_date is '入住日期';
comment on column rent_process_record.expected_living_to_date is '预计入住时间至';
comment on column rent_process_record.check_out_date is '退房日期';
comment on column rent_process_record.total_living_day is '总入住天数';
comment on column rent_process_record.created_by is '创建者';
comment on column rent_process_record.creation_date is '创建日期';
comment on column rent_process_record.last_updated_by is '最后更新者';
comment on column rent_process_record.last_updated_date is '最后更新时间';