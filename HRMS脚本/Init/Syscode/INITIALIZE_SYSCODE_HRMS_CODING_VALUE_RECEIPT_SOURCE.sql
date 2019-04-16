WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_RECEIPT_SOURCE.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_RECEIPT_SOURCE');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_RECEIPT_SOURCE','收款来源','收款来源','收款来源','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_RECEIPT_SOURCE','收款来源','收款来源','收款来源','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_RECEIPT_SOURCE','CHECK_IN_STAFF','入住人员','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_RECEIPT_SOURCE','CHECK_IN_STAFF','入住人员','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_RECEIPT_SOURCE','OTHERS','其他','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_RECEIPT_SOURCE','OTHERS','其他','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
