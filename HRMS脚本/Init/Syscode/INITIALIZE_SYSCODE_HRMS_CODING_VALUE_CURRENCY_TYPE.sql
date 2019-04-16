WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_CURRENCY_TYPE.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_CURRENCY_TYPE');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_CURRENCY_TYPE','币种','币种','币种','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_CURRENCY_TYPE','币种','币种','币种','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_CURRENCY_TYPE','RMB','人民币','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_CURRENCY_TYPE','RMB','人民币','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
