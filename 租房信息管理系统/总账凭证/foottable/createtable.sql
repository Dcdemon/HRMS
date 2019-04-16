drop table gld_gl_entry_head_16206;
drop table gld_gl_entry_line_16206;
drop sequence gld_gl_entry_head_16206_s;
drop sequence gld_gl_entry_line_16206_s;

-- Create table ����ƾ֤��Ϣ��(HEAD)
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
  is '����ƾ֤����';
-- Add comments to the columns 
comment on column GLD_GL_ENTRY_HEAD_16206.gl_entry_head_id
  is '������ƾ֤ͷ��id';
comment on column GLD_GL_ENTRY_HEAD_16206.gl_entry_code
  is 'ƾ֤��';
comment on column GLD_GL_ENTRY_HEAD_16206.create_date
  is '����';
comment on column GLD_GL_ENTRY_HEAD_16206.period
  is '�����ڼ�';
comment on column GLD_GL_ENTRY_HEAD_16206.attachement
  is '����';
comment on column GLD_GL_ENTRY_HEAD_16206.currency_code
  is '����';
comment on column GLD_GL_ENTRY_HEAD_16206.exchange_rate_type
  is '��������';
comment on column GLD_GL_ENTRY_HEAD_16206.exchange_rate
  is '����';
comment on column GLD_GL_ENTRY_HEAD_16206.status
  is '״̬��δ�ύ���ύ�����ͨ������˾ܾ���ȷ��';
comment on column GLD_GL_ENTRY_HEAD_16206.head_summary
  is 'ͷժҪ';
comment on column GLD_GL_ENTRY_HEAD_16206.auditor
  is '�����';
comment on column GLD_GL_ENTRY_HEAD_16206.documentmaker
  is '�Ƶ���';
comment on column GLD_GL_ENTRY_HEAD_16206.creation_date
  is '��������';
comment on column GLD_GL_ENTRY_HEAD_16206.created_by
  is '�����û�id';
comment on column GLD_GL_ENTRY_HEAD_16206.last_update_date
  is '����������';
comment on column GLD_GL_ENTRY_HEAD_16206.last_updated_by
  is '�������û�ID';
comment on column GLD_GL_ENTRY_HEAD_16206.poster
  is '������';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GLD_GL_ENTRY_HEAD_16206 add constraint GL_ENTRY_HEAD_ID primary key (GL_ENTRY_HEAD_ID);

-- Create table ����ƾ֤��Ϣ��(LINE)
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
  is '����ƾ֤�ӱ�';
-- Add comments to the columns 
comment on column GLD_GL_ENTRY_LINE_16206.gl_entry_line_id
  is 'ƾ֤�ӱ�id';
comment on column GLD_GL_ENTRY_LINE_16206.gl_entry_head_id
  is 'ƾ֤����id';
comment on column GLD_GL_ENTRY_LINE_16206.account_id
  is '��ƿ�Ŀ';
comment on column GLD_GL_ENTRY_LINE_16206.dr_amount
  is '�跽ԭ��';
comment on column GLD_GL_ENTRY_LINE_16206.cr_amount
  is '����ԭ��';
comment on column GLD_GL_ENTRY_LINE_16206.dr_functional
  is '�跽����';
comment on column GLD_GL_ENTRY_LINE_16206.cr_functional
  is '��������';
comment on column GLD_GL_ENTRY_LINE_16206.creation_date
  is '��������';
comment on column GLD_GL_ENTRY_LINE_16206.created_by
  is '�����û�id';
comment on column GLD_GL_ENTRY_LINE_16206.last_update_date
  is '����������';
comment on column GLD_GL_ENTRY_LINE_16206.last_updated_by
  is '�������û�ID';
comment on column GLD_GL_ENTRY_LINE_16206.line_summary
  is '��ժҪ';
-- Create/Recreate primary, unique and foreign key constraints 
alter table GLD_GL_ENTRY_LINE_16206 add constraint GL_ENTRY_LINE_ID primary key (GL_ENTRY_LINE_ID);

--��������
create sequence gld_gl_entry_head_16206_s increment by 1 start with 1;
create sequence gld_gl_entry_line_16206_s increment by 1 start with 1;
