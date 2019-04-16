WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool INITIALIZE_SYSCODE_HRMS_CODING_VALUE_HOUSE_TYPE.log

set feedback off
set define off

begin
sys_code_pkg.delete_sys_code('HRMS_CODING_VALUE_HOUSE_TYPE');
sys_code_pkg.insert_sys_code('HRMS_CODING_VALUE_HOUSE_TYPE','房屋类型','房屋类型','房屋类型','ZHS','');
sys_code_pkg.update_sys_code('HRMS_CODING_VALUE_HOUSE_TYPE','房屋状态','房屋类型','房屋类型','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ALREADY_EXPIRE','已到期','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ALREADY_EXPIRE','已到期','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ALREADY_RENTED','已租住','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ALREADY_RENTED','已租住','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','FREE','空闲','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','FREE','空闲','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ONE_ONE','一室一厅','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ONE_ONE','一室一厅','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','OTHER','其它','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','OTHER','其它','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','SCI_TRAIN_CENTER','科技培训中心','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','SCI_TRAIN_CENTER','科技培训中心','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','THREE_ONE','三室一厅','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','THREE_ONE','三室一厅','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','TWO_ONE','两室一厅','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','TWO_ONE','两室一厅','US','');

sys_code_pkg.insert_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ZJ_HOTEL','张江公寓','ZHS','');
sys_code_pkg.update_sys_code_value('HRMS_CODING_VALUE_HOUSE_TYPE','ZJ_HOTEL','张江公寓','US','');

end;
/
commit;
set feedback on
set define on

spool off
exit
