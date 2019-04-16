-- Create table
create table HRMS_VERIFICATION
(
  verification_id           NUMBER not null,
  verification_code         VARCHAR2(30),
  contract_code             VARCHAR2(30),
  verification_source_code  VARCHAR2(30),
  staff_id                  NUMBER,
  receipt_code              VARCHAR2(30),
  currency_code             VARCHAR2(30),
  remark                    VARCHAR2(1000),
  created_by                NUMBER not null,
  creation_date             DATE not null,
  last_updated_by           NUMBER not null,
  last_updated_date         DATE not null,
  total_verification_amount NUMBER
);
-- Add comments to the table 
comment on table HRMS_VERIFICATION
  is '核销表';
-- Add comments to the columns 
comment on column HRMS_VERIFICATION.verification_id
  is 'id主键';
comment on column HRMS_VERIFICATION.verification_code
  is '核销编号';
comment on column HRMS_VERIFICATION.contract_code
  is '合同编号';
comment on column HRMS_VERIFICATION.verification_source_code
  is '来源类别code';
comment on column HRMS_VERIFICATION.staff_id
  is '来源对象（人员id）';
comment on column HRMS_VERIFICATION.receipt_code
  is '来源单号（收款编号）';
comment on column HRMS_VERIFICATION.currency_code
  is '币种code';
comment on column HRMS_VERIFICATION.remark
  is '备注';
comment on column HRMS_VERIFICATION.created_by
  is '创建者';
comment on column HRMS_VERIFICATION.creation_date
  is '创建日期';
comment on column HRMS_VERIFICATION.last_updated_by
  is '最后更新者';
comment on column HRMS_VERIFICATION.last_updated_date
  is '最后更新时间';
comment on column HRMS_VERIFICATION.total_verification_amount
  is '核销总金额';
-- Create/Recreate indexes 
create unique index HRMS_VERIFICATION_U1 on HRMS_VERIFICATION (VERIFICATION_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_VERIFICATION
  add constraint HRMS_VERIFICATION_PK primary key (VERIFICATION_ID)
  using index ;
