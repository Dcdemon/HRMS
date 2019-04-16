-- Create table
create table HRMS_FEE
(
  fee_id            NUMBER not null,
  fee_code          VARCHAR2(30),
  start_date        DATE,
  end_date          DATE,
  fee_item_code     VARCHAR2(30),
  fee_source_code   VARCHAR2(30),
  fee_house_id      NUMBER,
  fee_cost          NUMBER,
  currency_code     VARCHAR2(30),
  remark            VARCHAR2(1000),
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_updated_by   NUMBER not null,
  last_updated_date DATE not null
);
-- Add comments to the table 
comment on table HRMS_FEE
  is '费用单';
-- Add comments to the columns 
comment on column HRMS_FEE.fee_id
  is 'id主键';
comment on column HRMS_FEE.fee_code
  is '费用单编号';
comment on column HRMS_FEE.start_date
  is '费用开始日';
comment on column HRMS_FEE.end_date
  is '费用结束日';
comment on column HRMS_FEE.fee_item_code
  is '费用项目code';
comment on column HRMS_FEE.fee_source_code
  is '费用来源code';
comment on column HRMS_FEE.fee_house_id
  is '费用对象（房屋id）';
comment on column HRMS_FEE.fee_cost
  is '费用金额';
comment on column HRMS_FEE.currency_code
  is '币种code';
comment on column HRMS_FEE.remark
  is '备注';
comment on column HRMS_FEE.created_by
  is '创建者';
comment on column HRMS_FEE.creation_date
  is '创建日期';
comment on column HRMS_FEE.last_updated_by
  is '最后更新者';
comment on column HRMS_FEE.last_updated_date
  is '最后更新时间';
-- Create/Recreate indexes 
create unique index HRMS_FEE_U1 on HRMS_FEE (FEE_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_FEE
  add constraint HRMS_FEE_PK primary key (FEE_ID)
  using index ;
