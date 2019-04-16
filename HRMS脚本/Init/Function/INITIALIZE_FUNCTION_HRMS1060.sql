begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','收款单信息管理',1,1,0);
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1060/hrms_receipt_maintain.screen','收款单信息维护',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1060','收款单信息管理','HRMS1000','F','modules/train_hrms/HRMS1060/hrms_receipt_main.screen',1060,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1060','Payment form information management','HRMS1000','F','modules/train_hrms/HRMS1060/hrms_receipt_main.screen',1060,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','modules/train_hrms/HRMS1060/hrms_receipt_main.screen');
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','modules/train_hrms/HRMS1060/hrms_receipt_maintain.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','train_hrms.HRMS1060.hrms_receipt_main');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','train_hrms.HRMS1060.hrms_receipt_maintain_init');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','train_hrms.HRMS1060.hrms_receipt_maintain');
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1060/hrms_receipt_main.screen','train_hrms.HRMS1060.hrms_query_job_number_lov');

end;
/
commit;
