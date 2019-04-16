WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_MESSAGE_HRMS1010_HOUSE_STATUS_IS_RENT_ERROR.log

set feedback off
set define off

begin
sys_message_pkg.sys_message_load('HRMS1010.HOUSE_STATUS_IS_RENT_ERROR','Error','The status of the house is rented and cannot be deleted!','US');
sys_message_pkg.sys_message_load('HRMS1010.HOUSE_STATUS_IS_RENT_ERROR','错误','房屋状态为已租住，不能删除！','ZHS');
end;
/
commit;
set feedback on
set define on

spool off
exit
