begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','入住人员信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1020/hrms_staff_maintain.screen','入住人员信息维护',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1020/hrms_staff_detail.screen','入住人员详细信息',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1020','入住人员信息管理','HRMS1000','F','modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen',1020,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1020','Check-in personnel information management','HRMS1000','F','modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen',1020,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','modules/train_hrms/HRMS1020/hrms_staff_maintain.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','modules/train_hrms/HRMS1020/hrms_staff_detail.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_delete_staff');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_get_new_staff_code');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_maintain_staff');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_query_all_job_number_lov');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_query_job_number_lov');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1020/hrms_check_in_staff_main.screen','train_hrms.HRMS1020.hrms_query_staff');

end;
/
commit;
