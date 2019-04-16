-- Create table
create table HRMS_RENT_PROCESS_RECORD
(
  rent_process_record_id  NUMBER not null,
  contract_id             NUMBER,
  staff_id                NUMBER,
  check_in_date           DATE,
  expected_living_to_date DATE,
  check_out_date          DATE,
  total_living_day        NUMBER,
  created_by              NUMBER not null,
  creation_date           DATE not null,
  last_updated_by         NUMBER not null,
  last_updated_date       DATE not null
);
-- Add comments to the table 
comment on table HRMS_RENT_PROCESS_RECORD
  is '入住过程记录';
-- Add comments to the columns 
comment on column HRMS_RENT_PROCESS_RECORD.rent_process_record_id
  is 'id主键';
comment on column HRMS_RENT_PROCESS_RECORD.contract_id
  is '合同id';
comment on column HRMS_RENT_PROCESS_RECORD.staff_id
  is '入住人员id';
comment on column HRMS_RENT_PROCESS_RECORD.check_in_date
  is '入住日期';
comment on column HRMS_RENT_PROCESS_RECORD.expected_living_to_date
  is '预计入住时间至';
comment on column HRMS_RENT_PROCESS_RECORD.check_out_date
  is '退房日期';
comment on column HRMS_RENT_PROCESS_RECORD.total_living_day
  is '总入住天数';
comment on column HRMS_RENT_PROCESS_RECORD.created_by
  is '创建者';
comment on column HRMS_RENT_PROCESS_RECORD.creation_date
  is '创建日期';
comment on column HRMS_RENT_PROCESS_RECORD.last_updated_by
  is '最后更新者';
comment on column HRMS_RENT_PROCESS_RECORD.last_updated_date
  is '最后更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_RENT_PROCESS_RECORD
  add constraint HRMS_RENT_PROCESS_RECORD_PK primary key (RENT_PROCESS_RECORD_ID)
  using index ;
