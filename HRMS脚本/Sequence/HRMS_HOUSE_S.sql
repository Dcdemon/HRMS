WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool HRMS_HOUSE_ID_SEQUENCE.log

prompt
prompt Creating sequence HRMS_HOUSE_ID_SEQUENCE
prompt =======================================
prompt
whenever sqlerror continue
drop sequence HRMS_HOUSE_ID_SEQUENCE;
whenever sqlerror exit failure rollback

create sequence HRMS_HOUSE_ID_SEQUENCE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

spool off
exit
