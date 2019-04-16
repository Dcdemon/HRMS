begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1030/hrms_contract_main.screen','合同信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1030/hrms_contract_maintain.screen','合同信息维护',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1030/hrms_contract_confirm.screen','合同详细信息',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1030','合同信息管理','HRMS1000','F','modules/train_hrms/HRMS1030/hrms_contract_main.screen',1030,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1030','Contract information management','HRMS1000','F','modules/train_hrms/HRMS1030/hrms_contract_main.screen',1030,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1030/hrms_contract_main.screen','modules/train_hrms/HRMS1030/hrms_contract_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1030/hrms_contract_main.screen','modules/train_hrms/HRMS1030/hrms_contract_maintain.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1030/hrms_contract_main.screen','modules/train_hrms/HRMS1030/hrms_contract_confirm.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_confirm_contract');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_get_new_contract_code');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_maintain_contract');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_query_contract');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_query_house_abbreviation_lov');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1030/hrms_contract_main.screen','train_hrms.HRMS1030.hrms_query_house_contract');

end;
/
commit;
