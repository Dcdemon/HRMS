WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
WHENEVER OSERROR  EXIT FAILURE ROLLBACK;

spool gld_gl_entry_16206.log

set feedback off
set define off
begin
--模块定义
  sys_function_pkg.sys_function_load('GLD_16206','总账凭证','BASE_TRAIN','G','','100','','ZHS');

--页面注册
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5010/gld_gl_entry_create.screen','gld_gl_entry_create',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5010/gld_gl_entry_save.svc','gld_gl_entry_save',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','gld_gl_entry_audit',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5020/gld_gl_entry_line_detail.screen','gld_gl_entry_line_detail',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','gld_gl_entry_posting',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5030/gld_gl_entry_posting_detail.screen','gld_gl_entry_posting_detail',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5040/gld_gl_entry_query.screen','gld_gl_entry_query',1,1,0);
  sys_service_pkg.sys_service_load('modules/train/16206/GLD5040/gld_gl_entry_detail_query.screen','gld_gl_entry_detail_query',1,1,0);

--功能定义
  sys_function_pkg.sys_function_load('GLD5010_16206','凭证录入','GLD_16206','F','modules/train/16206/GLD5010/gld_gl_entry_create.screen','5010','','ZHS');
  sys_function_pkg.sys_function_load('GLD5020_16206','凭证审核','GLD_16206','F','modules/train/16206/GLD5020/gld_gl_entry_audit.screen','5020','','ZHS');
  sys_function_pkg.sys_function_load('GLD5030_16206','凭证过账','GLD_16206','F','modules/train/16206/GLD5030/gld_gl_entry_posting.screen','5030','','ZHS');
  sys_function_pkg.sys_function_load('GLD5040_16206','凭证查询','GLD_16206','F','modules/train/16206/GLD5040/gld_gl_entry_query.screen','5040','','ZHS');
  
--分配页面
  sys_function_service_pkg.load_service('modules/train/16206/GLD5010/gld_gl_entry_create.screen','modules/train/16206/GLD5010/gld_gl_entry_save.svc');
  sys_function_service_pkg.load_service('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','modules/train/16206/GLD5020/gld_gl_entry_line_detail.screen');
  sys_function_service_pkg.load_service('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','modules/train/16206/GLD5030/gld_gl_entry_posting_detail.screen');
  sys_function_service_pkg.load_service('modules/train/16206/GLD5040/gld_gl_entry_query.screen','modules/train/16206/GLD5040/gld_gl_entry_detail_query.screen');  
--分配BM
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.find_period_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.find_currency_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.find_exchangerate_types_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.gld_gl_entry_head_submit');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.find_account_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.gld_gl_entry_head_save');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5010/gld_gl_entry_create.screen','train.16206.GLD5010.gld_gl_entry_line_save');
  
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5010.find_period_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5010.find_currency_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5010.find_exchangerate_types_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5020.gld_gl_entry_approve');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5020.gld_gl_entry_head_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5020.gld_gl_entry_info_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5020.gld_gl_entry_line_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5020/gld_gl_entry_audit.screen','train.16206.GLD5020.gld_gl_entry_reject');
  
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5010.find_period_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5010.find_currency_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5010.find_exchangerate_types_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5020.gld_gl_entry_line_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5030.gld_gl_entry_posting');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5030.gld_gl_entry_head_post_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5030/gld_gl_entry_posting.screen','train.16206.GLD5030.gld_gl_entry_post_query');
  
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5010.find_period_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5010.find_currency_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5010.find_exchangerate_types_vl_lov');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5040.gld_gl_entry_detail_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5020.gld_gl_entry_line_query');
  sys_register_bm_pkg.register_bm('modules/train/16206/GLD5040/gld_gl_entry_query.screen','train.16206.GLD5040.gld_gl_entry_query');
end;
/

commit;
set feedback on
set define on

spool off

exit
