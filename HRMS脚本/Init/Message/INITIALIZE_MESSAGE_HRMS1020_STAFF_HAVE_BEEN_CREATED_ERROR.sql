WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_MESSAGE_HRMS1020_STAFF_HAVE_BEEN_CREATED_ERROR.log

set feedback off
set define off

begin
sys_message_pkg.sys_message_load('HRMS1020.STAFF_HAVE_BEEN_CREATED_ERROR','Error','This employee has been created and cannot be created repeatedly','US');
sys_message_pkg.sys_message_load('HRMS1020.STAFF_HAVE_BEEN_CREATED_ERROR','����','��Ա���Ѿ������������ظ�����','ZHS');
end;
/
commit;
set feedback on
set define on

spool off
exit
