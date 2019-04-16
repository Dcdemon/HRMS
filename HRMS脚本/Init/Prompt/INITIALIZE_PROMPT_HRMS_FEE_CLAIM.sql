begin
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.RENT_FEE_PAYABLE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.RENT_FEE_PAYABLE','US','Rent fee payable');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.RENT_FEE_PAYABLE','ZHS','应付租金');  
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.PAID_RENT_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_RENT_FEE','US','Paid water fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_RENT_FEE','ZHS','已付租金');  

  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.WATER_FEE_PAYABLE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.WATER_FEE_PAYABLE','US','Water fee payable');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.WATER_FEE_PAYABLE','ZHS','应付水费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.PAID_WATER_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_WATER_FEE','US','Paid Water fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_WATER_FEE','ZHS','已付水费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.ELECTRICITY_FEE_PAYABLE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.ELECTRICITY_FEE_PAYABLE','US','Electricity fee payable');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.ELECTRICITY_FEE_PAYABLE','ZHS','应付电费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.PAID_ELECTRICITY_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_ELECTRICITY_FEE','US','Paid Electricity fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_ELECTRICITY_FEE','ZHS','已付电费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.NETWORK_FEE_PAYABLE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.NETWORK_FEE_PAYABLE','US','NetWork fee payable');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.NETWORK_FEE_PAYABLE','ZHS','应付宽带网络费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.PAID_NETWORK_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_NETWORK_FEE','US','Paid NetWork fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_NETWORK_FEE','ZHS','已付宽带网络费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.TV_FEE_PAYABLE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.TV_FEE_PAYABLE','US','Tv fee payable');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.TV_FEE_PAYABLE','ZHS','应付有线电视费');
  
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.PAID_TV_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_TV_FEE','US','Paid Tv fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.PAID_TV_FEE','ZHS','已付有线电视费');
  
  
  
  /*
  sys_prompt_pkg.delete_prompt('HRMS_FEE_CLAIM.');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.','US','');
  sys_prompt_pkg.sys_prompts_load('HRMS_FEE_CLAIM.','ZHS','');
  */

end;


