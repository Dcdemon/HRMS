WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_FEE_SOURCE.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_FEE_SOURCE');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_FEE_SOURCE','费用来源','费用来源','费用来源','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_FEE_SOURCE','费用来源','费用来源','费用来源','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_SOURCE','HOUSE','房屋','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_SOURCE','HOUSE','房屋','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
