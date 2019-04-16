-- Create table
create table HRMS_CHECK_IN_STAFF
(
  check_in_staff_id    NUMBER not null,
  staff_code           VARCHAR2(30),
  job_number           VARCHAR2(30),
  staff_name           VARCHAR2(30),
  sex_code             VARCHAR2(30),
  department_code      VARCHAR2(30),
  base_location_code   VARCHAR2(30),
  tel                  VARCHAR2(13),
  check_in_status_code VARCHAR2(30),
  email_address        VARCHAR2(30),
  remark               VARCHAR2(1000),
  created_by           NUMBER not null,
  creation_date        DATE not null,
  last_updated_by      NUMBER not null,
  last_updated_date    DATE not null
);
-- Add comments to the table 
comment on table HRMS_CHECK_IN_STAFF
  is '入住人员信息表';
-- Add comments to the columns 
comment on column HRMS_CHECK_IN_STAFF.check_in_staff_id
  is 'id主键';
comment on column HRMS_CHECK_IN_STAFF.staff_code
  is '人员编号';
comment on column HRMS_CHECK_IN_STAFF.job_number
  is '人员工号';
comment on column HRMS_CHECK_IN_STAFF.staff_name
  is '姓名';
comment on column HRMS_CHECK_IN_STAFF.sex_code
  is '性别code';
comment on column HRMS_CHECK_IN_STAFF.department_code
  is '所在部门code';
comment on column HRMS_CHECK_IN_STAFF.base_location_code
  is 'base地code';
comment on column HRMS_CHECK_IN_STAFF.tel
  is '联系电话';
comment on column HRMS_CHECK_IN_STAFF.check_in_status_code
  is '入住状态code';
comment on column HRMS_CHECK_IN_STAFF.email_address
  is '邮箱地址';
comment on column HRMS_CHECK_IN_STAFF.remark
  is '备注';
comment on column HRMS_CHECK_IN_STAFF.created_by
  is '创建者';
comment on column HRMS_CHECK_IN_STAFF.creation_date
  is '创建日期';
comment on column HRMS_CHECK_IN_STAFF.last_updated_by
  is '最后更新者';
comment on column HRMS_CHECK_IN_STAFF.last_updated_date
  is '最后更新时间';
-- Create/Recreate indexes 
create unique index HRMS_CHECK_IN_STAFF_U1 on HRMS_CHECK_IN_STAFF (STAFF_CODE);
-- Create/Recreate primary, unique and foreign key constraints 
alter table HRMS_CHECK_IN_STAFF
  add constraint HRMS_CHECK_IN_STAFF_PK primary key (CHECK_IN_STAFF_ID)
  using index ;
