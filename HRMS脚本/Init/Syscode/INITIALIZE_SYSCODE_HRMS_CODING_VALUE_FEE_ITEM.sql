WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_FEE_ITEM.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_FEE_ITEM');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_FEE_ITEM','费用项目','费用项目','费用项目','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_FEE_ITEM','费用项目','费用项目','费用项目','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','ELECTRICITY _FEE','电费','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','ELECTRICITY _FEE','电费','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','NETWORK_FEE','宽带网络费','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','NETWORK_FEE','宽带网络费','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','RENT_FEE','房租','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','RENT_FEE','房租','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','TV_FEE','有线电视费','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','TV_FEE','有线电视费','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','WATER_FEE','水费','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_FEE_ITEM','WATER_FEE','水费','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
