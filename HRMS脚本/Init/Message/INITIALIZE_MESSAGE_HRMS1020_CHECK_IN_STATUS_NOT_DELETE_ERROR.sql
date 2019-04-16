WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_MESSAGE_HRMS1020_CHECK_IN_STATUS_NOT_DELETE_ERROR.log

set feedback off
set define off

begin
sys_message_pkg.sys_message_load('HRMS1020.CHECK_IN_STATUS_NOT_DELETE_ERROR','Error','The status of the resident is "stayed" and cannot be deleted!','US');
sys_message_pkg.sys_message_load('HRMS1020.CHECK_IN_STATUS_NOT_DELETE_ERROR','错误','入住人员状态为“已入住”，不能删除！','ZHS');
end;
/
commit;
set feedback on
set define on

spool off
exit
