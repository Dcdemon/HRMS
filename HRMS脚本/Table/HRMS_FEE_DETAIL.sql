-- Create table
create table HRMS_FEE_DETAIL
(
  fee_detail_id     NUMBER not null,
  fee_id            NUMBER,
  staff_id          NUMBER,
  apportion_fee     NUMBER,
  created_by        NUMBER not null,
  creation_date     DATE not null,
  last_updated_by   NUMBER not null,
  last_updated_date DATE not null
);
-- Add comments to the table 
comment on table HRMS_FEE_DETAIL
  is '费用明细表';
-- Add comments to the columns 
comment on column HRMS_FEE_DETAIL.fee_detail_id
  is 'id主键';
comment on column HRMS_FEE_DETAIL.fee_id
  is '费用单id';
comment on column HRMS_FEE_DETAIL.staff_id
  is '人员id';
comment on column HRMS_FEE_DETAIL.apportion_fee
  is '分摊费用';
comment on column HRMS_FEE_DETAIL.created_by
  is '创建者';
comment on column HRMS_FEE_DETAIL.creation_date
  is '创建日期';
comment on column HRMS_FEE_DETAIL.last_updated_by
  is '最后更新者';
comment on column HRMS_FEE_DETAIL.last_updated_date
  is '最后更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_FEE_DETAIL
  add constraint HRMS_FEE_DETAIL_PK primary key (FEE_DETAIL_ID)
  using index ;
