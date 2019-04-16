WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_CHECK_IN_STATUS.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_CHECK_IN_STATUS');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_CHECK_IN_STATUS','入住状态','入住状态','入住状态','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_CHECK_IN_STATUS','入住状态','入住状态','入住状态','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','CHECKED_IN','已入住','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','CHECKED_IN','已入住','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','CHECKED_OUT','已退房','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','CHECKED_OUT','已退房','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','NEW','新建','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CHECK_IN_STATUS','NEW','新建','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
