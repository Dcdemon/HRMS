WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_BED_NUMBER.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_BED_NUMBER');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_BED_NUMBER','床位','床位','床位','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_BED_NUMBER','床位','床位','床位','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','2','2','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','2','2','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','3','3','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','3','3','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','4','4','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','4','4','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','5','5','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','5','5','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','6','6','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','6','6','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','7','7','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','7','7','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','8','8','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BED_NUMBER','8','8','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
