WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool HRMS_CHECK_IN_STAFF_S.log

prompt
prompt Creating sequence HRMS_CHECK_IN_STAFF_S
prompt =======================================
prompt
whenever sqlerror continue
drop sequence HRMS_CHECK_IN_STAFF_S;
whenever sqlerror exit failure rollback

create sequence HRMS_CHECK_IN_STAFF_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

spool off
exit
