-- Create table
create table HRMS_RECEIPT
(
  receipt_id          NUMBER not null,
  receipt_code        VARCHAR2(30),
  receipt_source_code VARCHAR2(30),
  staff_id            NUMBER,
  receipt_method_code VARCHAR2(30),
  receipt_amount      NUMBER,
  write_off_amount    NUMBER,
  currency_code       VARCHAR2(30),
  remark              VARCHAR2(1000),
  created_by          NUMBER not null,
  creation_date       DATE not null,
  last_updated_by     NUMBER not null,
  last_updated_date   DATE not null
);
-- Add comments to the table 
comment on table HRMS_RECEIPT
  is '收款单表';
-- Add comments to the columns 
comment on column HRMS_RECEIPT.receipt_id
  is 'id主键';
comment on column HRMS_RECEIPT.receipt_code
  is '收款编号';
comment on column HRMS_RECEIPT.receipt_source_code
  is '收款来源code';
comment on column HRMS_RECEIPT.staff_id
  is '收款对象（人员id）';
comment on column HRMS_RECEIPT.receipt_method_code
  is '收款方式code';
comment on column HRMS_RECEIPT.receipt_amount
  is '收款金额';
comment on column HRMS_RECEIPT.write_off_amount
  is '核销金额';
comment on column HRMS_RECEIPT.currency_code
  is '币种code';
comment on column HRMS_RECEIPT.remark
  is '备注';
comment on column HRMS_RECEIPT.created_by
  is '创建者';
comment on column HRMS_RECEIPT.creation_date
  is '创建日期';
comment on column HRMS_RECEIPT.last_updated_by
  is '最后更新者';
comment on column HRMS_RECEIPT.last_updated_date
  is '最后更新时间';
-- Create/Recreate indexes 
create unique index HRMS_RECEIPT_U1 on HRMS_RECEIPT (RECEIPT_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_RECEIPT
  add constraint HRMS_RECEIPT_PK primary key (RECEIPT_ID)
  using index ;
