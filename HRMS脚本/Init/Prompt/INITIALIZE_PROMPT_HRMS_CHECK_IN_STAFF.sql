begin
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.ADD');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.ADD','US','Add');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.ADD','ZHS','新增');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.BASE_LOCATION');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.BASE_LOCATION','US','base location');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.BASE_LOCATION','ZHS','base地');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.CHECK_IN_STATUS');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CHECK_IN_STATUS','US','check_in_status');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CHECK_IN_STATUS','ZHS','入住状态');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.CREATE_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATE_DATE_FROM','US','create date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATE_DATE_FROM','ZHS','创建日期从');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.CREATE_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATE_DATE_TO','US','create date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATE_DATE_TO','ZHS','创建日期至');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.CREATION_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATION_DATE','US','creation date');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.CREATION_DATE','ZHS','创建日期');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.DEPARTMENT');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.DEPARTMENT','US','department');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.DEPARTMENT','ZHS','所在部门');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.EMAIL_ADDRESS');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.EMAIL_ADDRESS','US','email address');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.EMAIL_ADDRESS','ZHS','邮箱地址');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.JOB_NUMBER');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.JOB_NUMBER','US','job number');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.JOB_NUMBER','ZHS','入住人员工号');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.REMARK');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.REMARK','US','remark');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.REMARK','ZHS','备注');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.SEX');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.SEX','US','sex');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.SEX','ZHS','性别');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.STAFF_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.STAFF_CODE','US','staff code');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.STAFF_CODE','ZHS','人员编号');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.STAFF_NAME');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.STAFF_NAME','US','staff name');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.STAFF_NAME','ZHS','入住人员姓名');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.TEL');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.TEL','US','tel');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.TEL','ZHS','联系电话');
  
  sys_prompt_pkg.delete_prompt('HRMS_CHECK_IN_STAFF.UPDATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.UPDATE','US','update');
  sys_prompt_pkg.sys_prompts_load('HRMS_CHECK_IN_STAFF.UPDATE','ZHS','修改');
                           
end;
