WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_RECEIPT_METHOD.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_RECEIPT_METHOD');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_RECEIPT_METHOD','收款方式','收款方式','收款方式','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_RECEIPT_METHOD','收款方式','收款方式','收款方式','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_RECEIPT_METHOD','BANK_TRANSFER','银行转账','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_RECEIPT_METHOD','BANK_TRANSFER','银行转账','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_RECEIPT_METHOD','CASH','现金','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_RECEIPT_METHOD','CASH','现金','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
