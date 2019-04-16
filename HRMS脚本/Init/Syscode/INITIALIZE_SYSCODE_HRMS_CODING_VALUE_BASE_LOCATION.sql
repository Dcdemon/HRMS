WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_BASE_LOCATION.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_BASE_LOCATION');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_BASE_LOCATION','base地','base地','base地','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_BASE_LOCATION','base地','base地','base地','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','BEIJING','北京','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','BEIJING','北京','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','GUANGZHOU','广州','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','GUANGZHOU','广州','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','SHANGHAI','上海','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_BASE_LOCATION','SHANGHAI','上海','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
