begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1050/hrms_fee_main.screen','费用信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1050/hrms_fee_maintain.screen','费用信息维护',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1050','费用信息管理','HRMS1000','F','modules/train_hrms/HRMS1050/hrms_fee_main.screen',1050,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1050','Cost information management','HRMS1000','F','modules/train_hrms/HRMS1050/hrms_fee_main.screen',1050,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1050/hrms_fee_main.screen','modules/train_hrms/HRMS1050/hrms_fee_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1050/hrms_fee_main.screen','modules/train_hrms/HRMS1050/hrms_fee_maintain.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1050/hrms_fee_main.screen','train_hrms.HRMS1050.hrms_fee_main');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1050/hrms_fee_main.screen','train_hrms.HRMS1050.hrms_fee_maintain');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1050/hrms_fee_main.screen','train_hrms.HRMS1050.hrms_get_fee_maintain_init');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1050/hrms_fee_main.screen','train_hrms.HRMS1050.hrms_query_house_abbreviation_lov');

end;
/
commit;
