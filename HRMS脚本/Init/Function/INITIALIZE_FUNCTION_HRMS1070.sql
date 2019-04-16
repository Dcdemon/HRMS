begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1070/hrms_verification_main.screen','核销单信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1070/hrms_verification_maintain.screen','核销单信息维护',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1070','核销单信息管理','HRMS1000','F','modules/train_hrms/HRMS1070/hrms_verification_main.screen',1070,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1070','Verification order information management','HRMS1000','F','modules/train_hrms/HRMS1070/hrms_verification_main.screen',1070,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1070/hrms_verification_main.screen','modules/train_hrms/HRMS1070/hrms_verification_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1070/hrms_verification_main.screen','modules/train_hrms/HRMS1070/hrms_verification_maintain.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_query_staff_name_lov');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_get_new_verification_code');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_verification_maintain');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_query_contract_code_lov');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_query_fee_claim');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1070/hrms_verification_main.screen','train_hrms.HRMS1070.hrms_verification_main');
end;
/
commit;
