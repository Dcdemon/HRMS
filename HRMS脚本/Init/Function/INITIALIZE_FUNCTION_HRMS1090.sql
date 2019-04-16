begin
--页面注册
sys_service_pkg.sys_service_load('modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen','入住人员应付费用查询',1,1,0);

--功能定义
sys_function_pkg.sys_function_load('HRMS1090','入住人员应付费用查询','HRMS1000','F','modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen',1090,'','ZHS');
sys_function_pkg.sys_function_load('HRMS1090','Check-in staff payable inquiry','HRMS1000','F','modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen',1090,'','US');

--分配页面
sys_function_service_pkg.load_service('modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen','modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen');

--分配bm
sys_register_bm_pkg.register_bm('modules/train_hrms/HRMS1090/hrms_staff_payable_report_form.screen','train_hrms.HRMS1090.hrms_staff_payable_report_form');
end;
/
commit;
