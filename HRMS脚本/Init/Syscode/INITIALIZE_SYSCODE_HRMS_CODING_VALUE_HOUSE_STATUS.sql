WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_HOUSE_STATUS.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_HOUSE_STATUS');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_HOUSE_STATUS','房屋状态','房屋状态','房屋状态','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_HOUSE_STATUS','房屋状态','房屋状态','房屋状态','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','ALREADY_EXPIRE','已到期','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','ALREADY_EXPIRE','已到期','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','ALREADY_RENTED','已租住','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','ALREADY_RENTED','已租住','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','FREE','空闲','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_STATUS','FREE','空闲','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
