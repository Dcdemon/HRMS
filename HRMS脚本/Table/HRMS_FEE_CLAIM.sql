-- Create table
create table HRMS_FEE_CLAIM
(
  fee_claim_id           NUMBER not null,
  contract_id            NUMBER,
  staff_id               NUMBER,
  rent_fee_remain        NUMBER,
  electricity_fee_remain NUMBER,
  water_fee_remain       NUMBER,
  network_fee_remain     NUMBER,
  tv_fee_remain          NUMBER,
  remark                 VARCHAR2(1000),
  created_by             NUMBER not null,
  creation_date          DATE not null,
  last_updated_by        NUMBER not null,
  last_updated_date      DATE not null,
  rent_fee_total         NUMBER,
  electricity_fee_total  NUMBER,
  water_fee_total        NUMBER,
  network_fee_total      NUMBER,
  tv_fee_total           NUMBER
);
-- Add comments to the table 
comment on table HRMS_FEE_CLAIM
  is '费用债权表';
-- Add comments to the columns 
comment on column HRMS_FEE_CLAIM.fee_claim_id
  is 'id主键';
comment on column HRMS_FEE_CLAIM.contract_id
  is '合同id';
comment on column HRMS_FEE_CLAIM.staff_id
  is '入住员工id';
comment on column HRMS_FEE_CLAIM.rent_fee_remain
  is '房租剩余债权';
comment on column HRMS_FEE_CLAIM.electricity_fee_remain
  is '电费剩余债权';
comment on column HRMS_FEE_CLAIM.water_fee_remain
  is '水费剩余债权';
comment on column HRMS_FEE_CLAIM.network_fee_remain
  is '网费剩余债权';
comment on column HRMS_FEE_CLAIM.tv_fee_remain
  is '电视费剩余债权';
comment on column HRMS_FEE_CLAIM.remark
  is '备注';
comment on column HRMS_FEE_CLAIM.created_by
  is '创建者';
comment on column HRMS_FEE_CLAIM.creation_date
  is '创建日期';
comment on column HRMS_FEE_CLAIM.last_updated_by
  is '最后更新者';
comment on column HRMS_FEE_CLAIM.last_updated_date
  is '最后更新时间';
comment on column HRMS_FEE_CLAIM.rent_fee_total
  is '总房租';
comment on column HRMS_FEE_CLAIM.electricity_fee_total
  is '总电费';
comment on column HRMS_FEE_CLAIM.water_fee_total
  is '总水费';
comment on column HRMS_FEE_CLAIM.network_fee_total
  is '总网费';
comment on column HRMS_FEE_CLAIM.tv_fee_total
  is '总电视费';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_FEE_CLAIM
  add constraint HRMS_FEE_CLAIM_PK primary key (FEE_CLAIM_ID)
  using index ;
