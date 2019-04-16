begin
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.EXPECTED_LIVING_TO_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.EXPECTED_LIVING_TO_DATE','US','Estimated check-in time to');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.EXPECTED_LIVING_TO_DATE','ZHS','预计入住时间至');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STAFF_DATA');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STAFF_DATA','US','Check-in information');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STAFF_DATA','ZHS','入住人员信息');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_FROM','US','Check-in date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_FROM','ZHS','入住日期从');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_TO','US','Check-In date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE_TO','ZHS','入住日期到');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE','US','Check-In date');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DATE','ZHS','入住日期');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DAYS');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DAYS','US','Check-In days');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_DAYS','ZHS','入住天数');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STATUS');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STATUS','US','check in status');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_IN_STATUS','ZHS','入住人员状态');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_OUT_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_OUT_DATE','US','check out date');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_OUT_DATE','ZHS','退房日期');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.CHECK_OUT');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_OUT','US','check out');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.CHECK_OUT','ZHS','退房');
  
  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.TOO_MANY_BEDS');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.TOO_MANY_BEDS','US','The number of guests has exceeded the number of beds and cannot be added!');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.TOO_MANY_BEDS','ZHS','入住人数已经超过床位数量，不能新增！');

  sys_prompt_pkg.delete_prompt('HRMS_RENT_PROCESS_RECORD.NOT_CHECK_IN_CAN_NOT_CHECK_OUT');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.NOT_CHECK_IN_CAN_NOT_CHECK_OUT','US','The status of the staying staff is not "stayed" and cannot be checked out!');
  sys_prompt_pkg.sys_prompts_load('HRMS_RENT_PROCESS_RECORD.NOT_CHECK_IN_CAN_NOT_CHECK_OUT','ZHS','入住人员状态不为"已入住"，不能退房！');
                           
end;


