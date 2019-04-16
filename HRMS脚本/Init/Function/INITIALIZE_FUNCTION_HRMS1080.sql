begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen','收款明细查询',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1080','收款明细查询','HRMS1000','F','modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen',1080,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1080','Receipt detail inquiry','HRMS1000','F','modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen',1080,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen','modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1080/hrms_receipt_report_form.screen','train_hrms.HRMS1080.hrms_receipt_report_form');
end;
/
commit;
