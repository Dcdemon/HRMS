-- Create table
create table HRMS_HOUSE
(
  house_id             NUMBER not null,
  house_code           VARCHAR2(30),
  house_abbreviation   VARCHAR2(30),
  house_type_code      VARCHAR2(30),
  bed_number_code      VARCHAR2(30),
  house_area_code      VARCHAR2(30),
  house_status_code    VARCHAR2(30),
  house_province_code  VARCHAR2(30),
  house_city_code      VARCHAR2(30),
  house_detail         VARCHAR2(50),
  intermediary_name    VARCHAR2(30),
  intermediary_contact VARCHAR2(30),
  intermediary_tel     VARCHAR2(13),
  landlord_name        VARCHAR2(30),
  landlord_tel         VARCHAR2(13),
  house_remark         VARCHAR2(1000),
  created_by           NUMBER not null,
  creation_date        DATE not null,
  last_updated_by      NUMBER not null,
  last_updated_date    DATE not null,
  living_person        NUMBER,
  rest_bed             NUMBER
);
-- Add comments to the table 
comment on table HRMS_HOUSE
  is '房屋信息表';
-- Add comments to the columns 
comment on column HRMS_HOUSE.house_id
  is 'id主键';
comment on column HRMS_HOUSE.house_code
  is '房屋编号';
comment on column HRMS_HOUSE.house_abbreviation
  is '房屋简称';
comment on column HRMS_HOUSE.house_type_code
  is '房屋类型code';
comment on column HRMS_HOUSE.bed_number_code
  is '床位code';
comment on column HRMS_HOUSE.house_area_code
  is '房屋面积code';
comment on column HRMS_HOUSE.house_status_code
  is '房屋状态code';
comment on column HRMS_HOUSE.house_province_code
  is '省code';
comment on column HRMS_HOUSE.house_city_code
  is '市code';
comment on column HRMS_HOUSE.house_detail
  is '详细地址';
comment on column HRMS_HOUSE.intermediary_name
  is '中介名称';
comment on column HRMS_HOUSE.intermediary_contact
  is '中介联系人';
comment on column HRMS_HOUSE.intermediary_tel
  is '中介联系电话';
comment on column HRMS_HOUSE.landlord_name
  is '房东姓名';
comment on column HRMS_HOUSE.landlord_tel
  is '房东联系电话';
comment on column HRMS_HOUSE.house_remark
  is '备注';
comment on column HRMS_HOUSE.created_by
  is '创建者';
comment on column HRMS_HOUSE.creation_date
  is '创建日期';
comment on column HRMS_HOUSE.last_updated_by
  is '最后更新者';
comment on column HRMS_HOUSE.last_updated_date
  is '最后更新时间';
comment on column HRMS_HOUSE.living_person
  is '入住人数';
comment on column HRMS_HOUSE.rest_bed
  is '剩余床位';
-- Create/Recreate indexes 
create unique index HRMS_HOUSE_U1 on HRMS_HOUSE (HOUSE_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_HOUSE
  add constraint HRMS_HOUSE_PK primary key (HOUSE_ID)
  using index ;
