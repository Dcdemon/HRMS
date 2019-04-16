-- Create table
create table HRMS_VERIFICATION_DETAIL
(
  verification_detail_id NUMBER not null,
  verification_id        NUMBER,
  bond_item_code         VARCHAR2(30),
  verification_amount    NUMBER,
  created_by             NUMBER not null,
  creation_date          DATE not null,
  last_updated_by        NUMBER not null,
  last_updated_date      DATE not null
);
-- Add comments to the table 
comment on table HRMS_VERIFICATION_DETAIL
  is '核销明细表';
-- Add comments to the columns 
comment on column HRMS_VERIFICATION_DETAIL.verification_detail_id
  is 'id主键';
comment on column HRMS_VERIFICATION_DETAIL.verification_id
  is '核销表id';
comment on column HRMS_VERIFICATION_DETAIL.bond_item_code
  is '债券项code';
comment on column HRMS_VERIFICATION_DETAIL.verification_amount
  is '核销金额';
comment on column HRMS_VERIFICATION_DETAIL.created_by
  is '创建者';
comment on column HRMS_VERIFICATION_DETAIL.creation_date
  is '创建日期';
comment on column HRMS_VERIFICATION_DETAIL.last_updated_by
  is '最后更新者';
comment on column HRMS_VERIFICATION_DETAIL.last_updated_date
  is '最后更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_VERIFICATION_DETAIL
  add constraint HRMS_VERIFICATION_DETAIL_PK primary key (VERIFICATION_DETAIL_ID)
  using index ;
