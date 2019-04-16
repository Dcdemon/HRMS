-- Create table
create table HRMS_CONTRACT
(
  contract_id          NUMBER not null,
  contract_code        VARCHAR2(30),
  start_date           DATE,
  end_date             DATE,
  house_id             NUMBER,
  month_rent_fee       NUMBER,
  rent_period          NUMBER,
  agency_fee           NUMBER,
  invoice_tax          NUMBER,
  total_fee            NUMBER,
  currency_type_code   VARCHAR2(30),
  rent_remark          VARCHAR2(1000),
  contract_remark      VARCHAR2(1000),
  contract_status_code VARCHAR2(30),
  created_by           NUMBER not null,
  creation_date        DATE not null,
  last_updated_by      NUMBER not null,
  last_updated_date    DATE not null,
  confirm_date         DATE,
  day_rent_fee         NUMBER
);
-- Add comments to the table 
comment on table HRMS_CONTRACT
  is '租房合同表';
-- Add comments to the columns 
comment on column HRMS_CONTRACT.contract_id
  is 'id主键';
comment on column HRMS_CONTRACT.contract_code
  is '房屋合同编号';
comment on column HRMS_CONTRACT.start_date
  is '合同开始日';
comment on column HRMS_CONTRACT.end_date
  is '合同到期日';
comment on column HRMS_CONTRACT.house_id
  is '房屋id';
comment on column HRMS_CONTRACT.month_rent_fee
  is '月租金';
comment on column HRMS_CONTRACT.rent_period
  is '租期';
comment on column HRMS_CONTRACT.agency_fee
  is '中介费';
comment on column HRMS_CONTRACT.invoice_tax
  is '发票税费';
comment on column HRMS_CONTRACT.total_fee
  is '总金额';
comment on column HRMS_CONTRACT.currency_type_code
  is '币种code';
comment on column HRMS_CONTRACT.rent_remark
  is '租金信息备注';
comment on column HRMS_CONTRACT.contract_remark
  is '合同备注';
comment on column HRMS_CONTRACT.contract_status_code
  is '合同状态code';
comment on column HRMS_CONTRACT.created_by
  is '创建者';
comment on column HRMS_CONTRACT.creation_date
  is '创建日期';
comment on column HRMS_CONTRACT.last_updated_by
  is '最后更新者';
comment on column HRMS_CONTRACT.last_updated_date
  is '最后更新时间';
comment on column HRMS_CONTRACT.confirm_date
  is '确认日期';
comment on column HRMS_CONTRACT.day_rent_fee
  is '日租金';
-- Create/Recreate indexes 
create unique index HRMS_CONTRACT_U1 on HRMS_CONTRACT (CONTRACT_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_CONTRACT
  add constraint HRMS_CONTRACT_PK primary key (CONTRACT_ID)
  using index ;
