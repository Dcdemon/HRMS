WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_MESSAGE_HRMS1020_CHECK_IN_STATUS_NOT_UPDATE_ERROR.log

set feedback off
set define off

begin
sys_message_pkg.sys_message_load('HRMS1020.CHECK_IN_STATUS_NOT_UPDATE_ERROR','Error','The status of the resident is "stayed" and cannot be modified!','US');
sys_message_pkg.sys_message_load('HRMS1020.CHECK_IN_STATUS_NOT_UPDATE_ERROR','����','��ס��Ա״̬Ϊ������ס���������޸ģ�','ZHS');
end;
/
commit;
set feedback on
set define on

spool off
exit
