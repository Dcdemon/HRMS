WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool HRMS_FEE_CLAIM_S.log

prompt
prompt Creating sequence HRMS_FEE_CLAIM_S
prompt =======================================
prompt
whenever sqlerror continue
drop sequence HRMS_FEE_CLAIM_S;
whenever sqlerror exit failure rollback

create sequence HRMS_FEE_CLAIM_S
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

spool off
exit
