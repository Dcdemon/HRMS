begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1010/hrms_house_main.screen','房屋信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1010/hrms_house_maintain.screen','房屋信息维护',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1010/hrms_house_detail.screen','房屋详细信息',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1010','房屋信息管理','HRMS1000','F','modules/train_hrms/HRMS1010/hrms_house_main.screen',1010,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1010','Housing Information Management','HRMS1000','F','modules/train_hrms/HRMS1010/hrms_house_main.screen',1010,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1010/hrms_house_main.screen','modules/train_hrms/HRMS1010/hrms_house_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1010/hrms_house_main.screen','modules/train_hrms/HRMS1010/hrms_house_maintain.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1010/hrms_house_main.screen','modules/train_hrms/HRMS1010/hrms_house_detail.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1010/hrms_house_main.screen','train_hrms.HRMS1010.hrms_add_house');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1010/hrms_house_main.screen','train_hrms.HRMS1010.hrms_delete_house');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1010/hrms_house_main.screen','train_hrms.HRMS1010.hrms_get_all_city');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1010/hrms_house_main.screen','train_hrms.HRMS1010.hrms_get_all_province');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1010/hrms_house_main.screen','train_hrms.HRMS1010.hrms_query_all_house');

end;
/
commit;
