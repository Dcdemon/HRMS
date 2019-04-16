create or replace package gld_gl_entry_interface_pkg is

  -- Author  : DAICHAO
  -- Created : 2017/8/17 9:33:56
  -- Purpose : 凭证信息导入pkg
  is_debug      boolean := false;
  is_enable_log boolean := true;
  -- 检查数据完整性。
  function check_gld_gl_entry_interface(p_header_id number) return number;

  -- 删除batch_id垃圾数据
  procedure delete_interface(p_batch_id number, p_user_id number);

  -- 插入导入的记录到显示表
  procedure insert_interface(p_header_id number,
                             p_batch_id  number,
                             p_user_id   number);

  --校验接口表
  procedure check_interface(p_batch_id      number,
                            p_user_id       number,
                            p_return_status out varchar2);

  --将接口表插入，头表和行表
  procedure insert_gld_entry(p_entry_code         gld_gl_entry_head_16206.gl_entry_code%type,
                             p_entry_date         date,
                             p_period_name        gld_gl_entry_head_16206.period%type,
                             p_attachement        gld_gl_entry_head_16206.attachement%type,
                             p_currency_code      gld_gl_entry_head_16206.currency_code%type,
                             p_exchange_rate_type gld_gl_entry_head_16206.exchange_rate_type%type,
                             p_exchange_rate      gld_gl_entry_head_16206.exchange_rate%type,
                             p_head_summary       gld_gl_entry_head_16206.head_summary%type,
                             p_line_summary       gld_gl_entry_line_16206.line_summary%type,
                             p_account_id         gld_gl_entry_line_16206.account_id%type,
                             p_dr                 gld_gl_entry_line_16206.dr_amount%type,
                             p_cr                 gld_gl_entry_line_16206.cr_amount%type,
                             p_user_id            number);
  --接口加载数据至业务表
  procedure load_gld_entry(p_batch_id    number,
                           p_user_id     number);
end gld_gl_entry_interface_pkg;
/
create or replace package body gld_gl_entry_interface_pkg is

  g_batch_id number;

  g_batch_line_id number;

  g_line_number number;

  e_error_header varchar2(30) := 'E_ERROR_HEADER';
  --格式化代码
  function format_code(p_code in varchar2) return varchar2 is
    v_code varchar2(200);
    v_pos  number;
  begin
    v_code := p_code;
    select instr(p_code, '.') into v_pos from dual;
    if v_pos > 0 then
      select substr(p_code, 0, instr(p_code, '.') - 1)
        into v_code
        from dual;
    end if;
    return v_code;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => 1,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'format_code');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end format_code;

  -- 检查数据完整性。
  function check_gld_gl_entry_interface(p_header_id number) return number is
    v_import_flag number := 1;
    cursor c_fnd_interface_lines is
      select *
        from fnd_interface_lines a
       where a.header_id = p_header_id
         and a.line_number >= 1;
  begin
    for c_fnd_interface_data in c_fnd_interface_lines loop
      if c_fnd_interface_data.attribute_1 is null or
         c_fnd_interface_data.attribute_2 is null or
         c_fnd_interface_data.attribute_3 is null or
         c_fnd_interface_data.attribute_4 is null or
         c_fnd_interface_data.attribute_5 is null or
         c_fnd_interface_data.attribute_6 is null or
         c_fnd_interface_data.attribute_7 is null or
         c_fnd_interface_data.attribute_8 is null or
         c_fnd_interface_data.attribute_9 is null or
         c_fnd_interface_data.attribute_10 is null then
        v_import_flag := 0;
      end if;
    end loop;
    return v_import_flag;
  end;

  --删除出错数据
  procedure delete_interface(p_batch_id number, p_user_id number) is
  begin
    delete from gld_gl_entry_import_interface t
     where t.batch_id = p_batch_id;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'delete_inferface');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_interface;

  -- 删除当前batch_id对应的错误信息
  procedure delete_error_logs is
    pragma autonomous_transaction;
  begin
    delete from gld_gl_entry_logs a
     where not exists (select 1
              from gld_gl_entry_import_interface b
             where a.batch_id = b.batch_id);
    delete from gld_gl_entry_logs a where a.batch_id = g_batch_id;
    commit;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => 1,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'delete_error_logs');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end delete_error_logs;

  -- 插入错误信息到日志
  procedure insert_error_log(p_message varchar2, p_user_id number) is
    pragma autonomous_transaction;
  begin
    if is_enable_log then
      insert into gld_gl_entry_logs
        (batch_id,
         batch_line_id,
         line_number,
         message,
         message_date,
         error_header,
         created_by,
         creation_date,
         last_updated_by,
         last_update_date)
      values
        (g_batch_id,
         g_batch_line_id,
         g_line_number,
         p_message,
         sysdate,
         e_error_header,
         p_user_id,
         sysdate,
         p_user_id,
         sysdate);
    end if;
    commit;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'insert_error_log');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end insert_error_log;

  -- 插入导入的记录到显示表
  procedure insert_interface(p_header_id number,
                             p_batch_id  number,
                             p_user_id   number) is
    cursor c_fnd_lines_datas is
      select *
        from fnd_interface_lines a
       where a.header_id = p_header_id
         and a.line_number >= 1;
  begin
    for v_fnd_lines_data in c_fnd_lines_datas loop
      v_fnd_lines_data.attribute_1  := v_fnd_lines_data.attribute_1;
      v_fnd_lines_data.attribute_2  := v_fnd_lines_data.attribute_2;
      v_fnd_lines_data.attribute_3  := v_fnd_lines_data.attribute_3;
      v_fnd_lines_data.attribute_4  := v_fnd_lines_data.attribute_4;
      v_fnd_lines_data.attribute_5  := v_fnd_lines_data.attribute_5;
      v_fnd_lines_data.attribute_6  := v_fnd_lines_data.attribute_6;
      v_fnd_lines_data.attribute_7  := v_fnd_lines_data.attribute_7;
      v_fnd_lines_data.attribute_8  := v_fnd_lines_data.attribute_8;
      v_fnd_lines_data.attribute_9  := v_fnd_lines_data.attribute_9;
      v_fnd_lines_data.attribute_10 := v_fnd_lines_data.attribute_10;
      v_fnd_lines_data.attribute_11 := v_fnd_lines_data.attribute_11;
      v_fnd_lines_data.attribute_12 := v_fnd_lines_data.attribute_12;
      v_fnd_lines_data.attribute_13 := v_fnd_lines_data.attribute_13;
      insert into gld_gl_entry_import_interface
        (batch_id,
         batch_line_id,
         line_number,
         import_flag,
         gl_entry_code,
         create_date,
         period,
         attachement,
         currency_code,
         exchange_rate_type,
         exchange_rate,
         head_summary,
         line_summary,
         account_id,
         dr_amount,
         cr_amount)
      values
        (p_batch_id,
         v_fnd_lines_data.line_number,
         v_fnd_lines_data.attribute_9, --行号
         'Y',
         v_fnd_lines_data.attribute_1, --凭证编号
         to_date(v_fnd_lines_data.attribute_2, 'yyyy-mm-dd'), --创建日期
         v_fnd_lines_data.attribute_3, --期间
         v_fnd_lines_data.attribute_4, --附件
         v_fnd_lines_data.attribute_5, --币种
         v_fnd_lines_data.attribute_6, --汇率类型
         v_fnd_lines_data.attribute_7, --汇率
         v_fnd_lines_data.attribute_8, --头摘要
         v_fnd_lines_data.attribute_10, --行摘要
         v_fnd_lines_data.attribute_11, --会计科目
         v_fnd_lines_data.attribute_12, --借方原币
         v_fnd_lines_data.attribute_13 --贷方原币
         );
    end loop;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'insert_interface');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end insert_interface;

  --将接口表插入，头表和行表
  procedure insert_gld_entry(p_entry_code         gld_gl_entry_head_16206.gl_entry_code%type,
                             p_entry_date         date,
                             p_period_name        gld_gl_entry_head_16206.period%type,
                             p_attachement        gld_gl_entry_head_16206.attachement%type,
                             p_currency_code      gld_gl_entry_head_16206.currency_code%type,
                             p_exchange_rate_type gld_gl_entry_head_16206.exchange_rate_type%type,
                             p_exchange_rate      gld_gl_entry_head_16206.exchange_rate%type,
                             p_head_summary       gld_gl_entry_head_16206.head_summary%type,
                             p_line_summary       gld_gl_entry_line_16206.line_summary%type,
                             p_account_id         gld_gl_entry_line_16206.account_id%type,
                             p_dr                 gld_gl_entry_line_16206.dr_amount%type,
                             p_cr                 gld_gl_entry_line_16206.cr_amount%type,
                             p_user_id            number) is
  
    v_count  number;
    v_headid number;
    v_status varchar(50) := 'SUBMIT';
  begin
    select count(1) --判断如果存在同样的凭证编号则更新，否则插入新数据
      into v_count
      from gld_gl_entry_head_16206 t
     where t.gl_entry_code = p_entry_code;
  
    if v_count > 0 then
      select g.gl_entry_head_id
        into v_headid
        from gld_gl_entry_head_16206 g
       where g.gl_entry_code = p_entry_code;
    
      update gld_gl_entry_head_16206 gh --更新头表
         set gh.gl_entry_code      = p_entry_code,
             gh.create_date        = p_entry_date,
             gh.period             = p_period_name,
             gh.attachement        = p_attachement,
             gh.currency_code      = p_currency_code,
             gh.exchange_rate_type = p_exchange_rate_type,
             gh.exchange_rate      = p_exchange_rate,
             gh.head_summary       = p_head_summary,
             last_updated_by       = p_user_id,
             last_update_date      = sysdate
       where gh.gl_entry_code = p_entry_code;
    
      insert into gld_gl_entry_line_16206 --更新行表
        (gl_entry_line_id,
         gl_entry_head_id,
         account_id,
         dr_amount,
         cr_amount,
         dr_functional,
         cr_functional,
         creation_date,
         created_by,
         last_update_date,
         last_updated_by,
         line_summary)
      values
        (gld_gl_entry_line_16206_S.NEXTVAL,
         v_headid,
         p_account_id,
         p_dr,
         p_cr,
         p_dr * p_exchange_rate,
         p_cr * p_exchange_rate,
         sysdate,
         p_user_id,
         sysdate,
         p_user_id,
         p_line_summary);
    else
      v_headid := gld_gl_entry_head_16206_s.nextval;
      insert into gld_gl_entry_head_16206 --插入新数据至头表
        (gl_entry_head_id,
         gl_entry_code,
         create_date,
         period,
         attachement,
         currency_code,
         exchange_rate_type,
         exchange_rate,
         status,
         head_summary,
         documentmaker,
         creation_date,
         created_by,
         last_update_date,
         last_updated_by)
      values
        (v_headid,
         p_entry_code,
         p_entry_date,
         p_period_name,
         p_attachement,
         p_currency_code,
         p_exchange_rate_type,
         p_exchange_rate,
         v_status,
         p_head_summary,
         p_user_id,
         sysdate,
         p_user_id,
         sysdate,
         p_user_id);
    
      insert into gld_gl_entry_line_16206
        (gl_entry_line_id,
         gl_entry_head_id,
         account_id,
         dr_amount,
         cr_amount,
         dr_functional,
         cr_functional,
         creation_date,
         created_by,
         last_update_date,
         last_updated_by,
         line_summary)
      values
        (gld_gl_entry_line_16206_s.NEXTVAL,
         v_headid,
         p_account_id,
         p_dr,
         p_cr,
         p_dr * p_exchange_rate,
         p_cr * p_exchange_rate,
         sysdate,
         p_user_id,
         sysdate,
         p_user_id,
         p_line_summary);
    end if;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'insert_gld_entry');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end insert_gld_entry;

  --接口加载数据至业务表
  procedure load_gld_entry(p_batch_id    number,
                           p_user_id     number) is
    cursor c_import_datas is
      select *
        from gld_gl_entry_import_interface a
       where a.batch_id = p_batch_id
         and a.import_flag = 'Y'
         for update nowait;
         
  begin
    
    for v_line in c_import_datas loop
      insert_gld_entry(p_entry_code         => v_line.gl_entry_code,
                       p_entry_date         => v_line.create_date,
                       p_period_name        => v_line.period,
                       p_attachement        => v_line.attachement,
                       p_currency_code      => v_line.currency_code,
                       p_exchange_rate_type => v_line.exchange_rate_type,
                       p_exchange_rate      => v_line.exchange_rate,
                       p_head_summary       => v_line.head_summary,
                       p_line_summary       => v_line.line_summary,
                       p_account_id         => v_line.account_id,
                       p_dr                 => v_line.dr_amount,
                       p_cr                 => v_line.cr_amount,
                       p_user_id            => p_user_id);
    
      update gld_gl_entry_import_interface a
         set a.import_flag = 'N'
       where a.batch_id = v_line.batch_id
         and a.batch_line_id = v_line.batch_line_id;
    
    end loop;
  
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'load_gld_entry');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end load_gld_entry;
  --检验凭证编号
  function get_entry_code(p_entry_code in varchar2, p_user_id in number)
    return number is
    v_entry_head_id number;
  begin
    if p_entry_code is null then
      insert_error_log('凭证编号为空', p_user_id);
      return 0;
    else
      select count(*)
        into v_entry_head_id
        from gld_gl_entry_head_16206 h
       where h.gl_entry_code = p_entry_code;
      if v_entry_head_id > 0 then
        insert_error_log('凭证编号已存在', p_user_id);
        return v_entry_head_id;
      else
        return 1;
      end if;
    end if;
  exception
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_created_by              => p_user_id,
                                                     p_procedure_function_name => 'get_entry_code');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end;

  --核对接口表
  procedure check_interface(p_batch_id      in number,
                            p_user_id       in number,
                            p_return_status out varchar2) is
    cursor c_gld_import_interface is
      select *
        from gld_gl_entry_import_interface a
       where a.batch_id = p_batch_id
         and a.import_flag = 'Y';
    v_entry_no_flag number;
  begin
    g_batch_id      := p_batch_id;
    p_return_status := 'SUCCESS';
    delete_error_logs;
    for v_line in c_gld_import_interface loop
      g_batch_id      := v_line.batch_id;
      g_batch_line_id := v_line.batch_line_id;
      g_line_number   := v_line.line_number;
      v_entry_no_flag := get_entry_code(p_entry_code => v_line.gl_entry_code,
                                        p_user_id    => p_user_id);
      if v_entry_no_flag != 1 then
        p_return_status := 'FAILED';
      end if;
    end loop;
  exception
  
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_backtrace || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_interface_pkg',
                                                     p_procedure_function_name => 'check_interface');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end check_interface;
end gld_gl_entry_interface_pkg;
/
