WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_DEPARTMENT.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_DEPARTMENT');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_DEPARTMENT','所在部门','所在部门','所在部门','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_DEPARTMENT','1','所在部门','所在部门','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','MAS','MAS','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','MAS','MAS','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','ORACLE','ORACLE','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','ORACLE','ORACLE','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','SAP','SAP','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_DEPARTMENT','SAP','SAP','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
