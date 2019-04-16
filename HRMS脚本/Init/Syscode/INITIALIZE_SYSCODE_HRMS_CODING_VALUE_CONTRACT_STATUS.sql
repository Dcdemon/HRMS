WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_CONTRACT_STATUS.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_CONTRACT_STATUS');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_CONTRACT_STATUS','房屋合同状态','房屋合同状态','房屋合同状态','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_CONTRACT_STATUS','房屋合同状态','房屋合同状态','房屋合同状态','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CHECK_OUT','已退租','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CHECK_OUT','已退租','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CONFIRM','合同确认','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CONFIRM','合同确认','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CREATION','创建','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CONTRACT_STATUS','CREATION','创建','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
