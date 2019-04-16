begin
  sys_prompt_pkg.delete_prompt('HRMS_FEE.FEE_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_CODE','US','fee code');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_CODE','ZHS','费用单编号');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.START_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE','US','fee start date');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE','ZHS','费用发生日');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.END_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.END_DATE','US','fee end date');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.END_DATE','ZHS','费用结束日');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.FEE_ITEM');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_ITEM','US','fee item');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_ITEM','ZHS','费用项目');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.FEE_SOURCE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_SOURCE','US','fee source');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_SOURCE','ZHS','费用来源');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.FEE_OBJECT');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_OBJECT','US','fee object');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_OBJECT','ZHS','费用对象');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.FEE_COST');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_COST','US','fee cost');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.FEE_COST','ZHS','费用金额');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.ADD_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE','US','add date');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE','ZHS','新增日期');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.ADD_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE_FROM','US','add date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE_FROM','ZHS','新增日期从');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.ADD_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE_TO','US','add date TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.ADD_DATE_TO','ZHS','新增日期到');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.START_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE_FROM','US','start date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE_FROM','ZHS','费用发生日从');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE.START_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE_TO','US','start date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.START_DATE_TO','ZHS','费用发生日到');

  /*
  sys_prompt_pkg.delete_prompt('HRMS_FEE.');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.','US','');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE.','ZHS','');
  */
end;


