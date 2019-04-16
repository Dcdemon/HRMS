WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_HOUSE_AREA.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_HOUSE_AREA');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_HOUSE_AREA','房屋面积','房屋面积','房屋面积','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_HOUSE_AREA','房屋面积','房屋面积','房屋面积','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','100_CM2','100平方以上','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','100_CM2','100平方以上','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','10_30CM2','10-30平方','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','10_30CM2','10-30平方','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','30_50 CM2','30-50平方','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','30_50 CM2','30-50平方','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','50_70 CM2','50-70平方','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','50_70 CM2','50-70平方','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','70_100CM2','70-100平方','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_AREA','70_100CM2','70-100平方','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
