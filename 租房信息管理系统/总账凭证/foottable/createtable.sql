drop table gld_gl_entry_head_16206;
drop table gld_gl_entry_line_16206;
drop sequence gld_gl_entry_head_16206_s;
drop sequence gld_gl_entry_line_16206_s;

-- Create table 总账凭证信息表(HEAD)
create table GLD_GL_ENTRY_HEAD_16206
(
  gl_entry_head_id   NUMBER not null,
  gl_entry_code      VARCHAR2(30) not null,
  create_date        DATE not null,
  period             VARCHAR2(50),
  attachement        VARCHAR2(50),
  currency_code      VARCHAR2(50),
  exchange_rate_type VARCHAR2(50),
  exchange_rate      NUMBER,
  status             VARCHAR2(50),
  head_summary       VARCHAR2(50),
  auditor            VARCHAR2(20),
  documentmaker      VARCHAR2(20),
  creation_date      DATE,
  created_by         NUMBER,
  last_update_date   DATE,
  last_updated_by    NUMBER,
  poster             VARCHAR2(20)
);
-- Add comments to the table 
comment on table GLD_GL_ENTRY_HEAD_16206
  is '总账凭证主表';
-- Add comments to the columns 
comment on column GLD_GL_ENTRY_HEAD_16206.gl_entry_head_id
  is '主键：凭证头表id';
comment on column GLD_GL_ENTRY_HEAD_16206.gl_entry_code
  is '凭证号';
comment on column GLD_GL_ENTRY_HEAD_16206.create_date
  is '日期';
comment on column GLD_GL_ENTRY_HEAD_16206.period
  is '总账期间';
comment on column GLD_GL_ENTRY_HEAD_16206.attachement
  is '附件';
comment on column GLD_GL_ENTRY_HEAD_16206.currency_code
  is '币种';
comment on column GLD_GL_ENTRY_HEAD_16206.exchange_rate_type
  is '汇率类型';
comment on column GLD_GL_ENTRY_HEAD_16206.exchange_rate
  is '汇率';
comment on column GLD_GL_ENTRY_HEAD_16206.status
  is '状态：未提交、提交、审核通过、审核拒绝和确认';
comment on column GLD_GL_ENTRY_HEAD_16206.head_summary
  is '头摘要';
comment on column GLD_GL_ENTRY_HEAD_16206.auditor
  is '审核人';
comment on column GLD_GL_ENTRY_HEAD_16206.documentmaker
  is '制单人';
comment on column GLD_GL_ENTRY_HEAD_16206.creation_date
  is '创建日期';
comment on column GLD_GL_ENTRY_HEAD_16206.created_by
  is '创建用户id';
comment on column GLD_GL_ENTRY_HEAD_16206.last_update_date
  is '最后更新日期';
comment on column GLD_GL_ENTRY_HEAD_16206.last_updated_by
  is '最后更新用户ID';
comment on column GLD_GL_ENTRY_HEAD_16206.poster
  is '过账人';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GLD_GL_ENTRY_HEAD_16206 add constraint GL_ENTRY_HEAD_ID primary key (GL_ENTRY_HEAD_ID);

-- Create table 总账凭证信息表(LINE)
create table GLD_GL_ENTRY_LINE_16206
(
  gl_entry_line_id NUMBER not null,
  gl_entry_head_id NUMBER not null,
  account_id       NUMBER not null,
  dr_amount        NUMBER,
  cr_amount        NUMBER,
  dr_functional    NUMBER,
  cr_functional    NUMBER,
  creation_date    DATE,
  created_by       NUMBER,
  last_update_date DATE,
  last_updated_by  NUMBER,
  line_summary     VARCHAR2(50)
);

-- Add comments to the table 
comment on table GLD_GL_ENTRY_LINE_16206
  is '总账凭证子表';
-- Add comments to the columns 
comment on column GLD_GL_ENTRY_LINE_16206.gl_entry_line_id
  is '凭证子表id';
comment on column GLD_GL_ENTRY_LINE_16206.gl_entry_head_id
  is '凭证主表id';
comment on column GLD_GL_ENTRY_LINE_16206.account_id
  is '会计科目';
comment on column GLD_GL_ENTRY_LINE_16206.dr_amount
  is '借方原币';
comment on column GLD_GL_ENTRY_LINE_16206.cr_amount
  is '贷方原币';
comment on column GLD_GL_ENTRY_LINE_16206.dr_functional
  is '借方本币';
comment on column GLD_GL_ENTRY_LINE_16206.cr_functional
  is '贷方本币';
comment on column GLD_GL_ENTRY_LINE_16206.creation_date
  is '创建日期';
comment on column GLD_GL_ENTRY_LINE_16206.created_by
  is '创建用户id';
comment on column GLD_GL_ENTRY_LINE_16206.last_update_date
  is '最后更新日期';
comment on column GLD_GL_ENTRY_LINE_16206.last_updated_by
  is '最后更新用户ID';
comment on column GLD_GL_ENTRY_LINE_16206.line_summary
  is '行摘要';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GLD_GL_ENTRY_LINE_16206 add constraint GL_ENTRY_LINE_ID primary key (GL_ENTRY_LINE_ID);

--创建序列
create sequence gld_gl_entry_head_16206_s increment by 1 start with 1;
create sequence gld_gl_entry_line_16206_s increment by 1 start with 1;
