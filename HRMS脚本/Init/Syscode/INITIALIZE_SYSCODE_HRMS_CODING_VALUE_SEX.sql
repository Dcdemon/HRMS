WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_SEX.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_SEX');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_SEX','性别','性别','性别','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_SEX','性别','性别','性别','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_SEX','MAN','男','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_SEX','MAN','男','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_SEX','WOMEN','女','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_SEX','WOMEN','女','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
