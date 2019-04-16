WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool RENT_PROCESS_RECORD_S.log

prompt
prompt Creating sequence RENT_PROCESS_RECORD_S
prompt =======================================
prompt
whenever sqlerror continue
drop sequence RENT_PROCESS_RECORD_S;
whenever sqlerror exit failure rollback

create sequence RENT_PROCESS_RECORD_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

spool off
exit
