begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1040/hrms_check_out.screen','人员入住过程管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1040/hrms_check_in.screen','人员入住',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1040','人员入住过程管理','HRMS1000','F','modules/train_hrms/HRMS1040/hrms_check_out.screen',1040,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1040','Personnel occupancy process management','HRMS1000','F','modules/train_hrms/HRMS1040/hrms_check_out.screen',1040,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1040/hrms_check_out.screen','modules/train_hrms/HRMS1040/hrms_check_out.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1040/hrms_check_out.screen','modules/train_hrms/HRMS1040/hrms_check_in.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1040/hrms_check_out.screen','train_hrms.HRMS1040.hrms_check_in');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1040/hrms_check_out.screen','train_hrms.HRMS1040.hrms_check_out');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1040/hrms_check_out.screen','train_hrms.HRMS1040.hrms_query_job_number_lov');

end;
/
commit;
