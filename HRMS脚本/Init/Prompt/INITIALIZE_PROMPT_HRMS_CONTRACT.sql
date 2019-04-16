begin
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.AGENCY_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.AGENCY_FEE','US','agency fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.AGENCY_FEE','ZHS','中介费');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONTRACT_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_CODE','US','contract code');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_CODE','ZHS','房屋合同编号');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONTRACT_REMARK');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_REMARK','US','contract remark');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_REMARK','ZHS','合同备注');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONTRACT_STATUS');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS','US','contract status');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS','ZHS','租房合同状态');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CURRENCY_TYPE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CURRENCY_TYPE','US','currency type');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CURRENCY_TYPE','ZHS','币种');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.END_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.END_DATE','US','end date');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.END_DATE','ZHS','合同到期日');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.INVOICE_TAX');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.INVOICE_TAX','US','invoice tax');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.INVOICE_TAX','ZHS','发票税费');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.MONTH_RENT_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.MONTH_RENT_FEE','US','month rent fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.MONTH_RENT_FEE','ZHS','月租金');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.RENT_DATA');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_DATA','US','Rent Data');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_DATA','ZHS','租金信息');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.RENT_PERIOD');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_PERIOD','US','rent period');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_PERIOD','ZHS','租期');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.RENT_REMARK');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_REMARK','US','rent remark');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RENT_REMARK','ZHS','租金信息备注');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.RMB');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RMB','US','RMB');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.RMB','ZHS','人民币');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.START_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE','US','start date');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE','ZHS','合同开始日');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.START_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE_FROM','US','start date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE_FROM','ZHS','合同开始日期从');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.START_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE_TO','US','start date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.START_DATE_TO','ZHS','合同开始日期到');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.TOTAL_FEE');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.TOTAL_FEE','US','total fee');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.TOTAL_FEE','ZHS','总金额');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONFIRM');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONFIRM','US','Confirm');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONFIRM','ZHS','确认');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CHECK_IN');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CHECK_IN','US','Check In');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CHECK_IN','ZHS','入住');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CREATED');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CREATED','US','The contract status is not "created" and cannot be modified!');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CREATED','ZHS','合同状态不是"创建"，不能修改！');
  
  sys_prompt_pkg.delete_prompt('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CONFIRM');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CONFIRM','US','The contract status is not "confirmed" and cannot be checked in!');
  sys_prompt_pkg.sys_prompts_load('HRMS_CONTRACT.CONTRACT_STATUS_IS_NOT_CONFIRM','ZHS','合同状态不是"确认"，不能入住！');
                                
end;
