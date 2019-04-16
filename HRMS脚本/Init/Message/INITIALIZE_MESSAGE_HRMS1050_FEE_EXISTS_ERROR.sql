WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_MESSAGE_HRMS1050_FEE_EXISTS_ERROR.log

set feedback off
set define off

begin
sys_message_pkg.sys_message_load('HRMS1050.FEE_EXISTS_ERROR','Error','The fee has been posted','US');
sys_message_pkg.sys_message_load('HRMS1050.FEE_EXISTS_ERROR','错误','该费用已发布！','ZHS');
end;
/
commit;
set feedback on
set define on

spool off
exit
