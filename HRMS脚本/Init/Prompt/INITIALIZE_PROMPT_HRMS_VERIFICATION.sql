begin
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_CODE','US','verification code');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_CODE','ZHS','�������');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_SOURCE');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_SOURCE','US','verification source');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_SOURCE','ZHS','��Դ���');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_OBJECT');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_OBJECT','US','verification object');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_OBJECT','ZHS','��Դ����');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.RECEIPT_CODE');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_CODE','US','receipt code');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_CODE','ZHS','��Դ����');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.TOTAL_VERIFICATION_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.TOTAL_VERIFICATION_AMOUNT','US','total verification amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.TOTAL_VERIFICATION_AMOUNT','ZHS','�����ܽ��');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.BOND_ITEM');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.BOND_ITEM','US','bond item');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.BOND_ITEM','ZHS','ծȯ��');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_AMOUNT','US','verification amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_AMOUNT','ZHS','�������');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_DATE');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE','US','verification date');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE','ZHS','��������');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_DATE_FROM');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE_FROM','US','verification date from');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE_FROM','ZHS','�������ڴ�');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_DATE_TO');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE_TO','US','verification date to');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_DATE_TO','ZHS','�������ڵ�');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.HAVE_VERIFICATION_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.HAVE_VERIFICATION_AMOUNT','US','have verification amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.HAVE_VERIFICATION_AMOUNT','ZHS','�Ѻ������');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.WAIT_VERIFICATION_AMOUNT');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.WAIT_VERIFICATION_AMOUNT','US','wait verification amount');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.WAIT_VERIFICATION_AMOUNT','ZHS','δ�������');

  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.REST_CLAIM');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.REST_CLAIM','US','rest claim');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.REST_CLAIM','ZHS','ʣ��ծȨ');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_THIS');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_THIS','US','verification this');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_THIS','ZHS','���κ���');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.RECEIPT_VERIFICATION_SOURCE_SELECTION');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_VERIFICATION_SOURCE_SELECTION','US','Receipt verification source selection');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_VERIFICATION_SOURCE_SELECTION','ZHS','�տ������Դѡ��');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.RECEIPT_DATA');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_DATA','US','receipt data');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_DATA','ZHS','�տ�����');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.RECEIPT_VERIFICATION');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_VERIFICATION','US','receipt verification');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.RECEIPT_VERIFICATION','ZHS','�տ����');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.WRITE_OFF_AMOUNT_TOO_LARGE');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.WRITE_OFF_AMOUNT_TOO_LARGE','US','The write-off amount is greater than the unapplied amount!');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.WRITE_OFF_AMOUNT_TOO_LARGE','ZHS','���κ���������δ������');
  
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.VERIFICATION_SUCCESS');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_SUCCESS','US','The verification is successful!');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.VERIFICATION_SUCCESS','ZHS','�����ɹ���');
  
  /*
  sys_prompt_pkg.delete_prompt('HRMS_VERIFICATION.');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.','US','');
  sys_prompt_pkg.sys_prompts_load('HRMS_VERIFICATION.','ZHS','');
  */

end;


