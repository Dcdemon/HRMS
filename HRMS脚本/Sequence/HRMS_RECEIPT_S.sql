WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool HRMS_RECEIPT_S.log

prompt
prompt Creating sequence HRMS_RECEIPT_S
prompt =======================================
prompt
whenever sqlerror continue
drop sequence HRMS_RECEIPT_S;
whenever sqlerror exit failure rollback

create sequence HRMS_RECEIPT_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

spool off
exit
