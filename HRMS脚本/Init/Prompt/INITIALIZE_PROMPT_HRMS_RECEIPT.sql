begin
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_CODE','US','Receipt Code');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_CODE','ZHS','收款编号');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_SOURCE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_SOURCE','US','receipt source');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_SOURCE','ZHS','收款来源');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_OBJECT');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_OBJECT','US','receipt object');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_OBJECT','ZHS','收款对象');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_METHOD');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_METHOD','US','receipt method');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_METHOD','ZHS','收款方式');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_AMOUNT','US','receipt amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_AMOUNT','ZHS','收款金额');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.WRITE_OFF_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.WRITE_OFF_AMOUNT','US','write off amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.WRITE_OFF_AMOUNT','ZHS','核销金额');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.CURRENCY_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.CURRENCY_CODE','US','currency code');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.CURRENCY_CODE','ZHS','币种');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE','US','receipt date');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE','ZHS','收款日期');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE_FROM','US','receipt date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE_FROM','ZHS','收款日期从');
  
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.RECEIPT_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE_TO','US','receipt date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.RECEIPT_DATE_TO','ZHS','收款日期到');
  
  
  
  /*
  sys_prompt_pkg.delete_prompt('HRMS_RECEIPT.');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.','US','');
  sys_prompt_pkg.sys_prompts_load('HRMS_RECEIPT.','ZHS','');
  */
          
end;


