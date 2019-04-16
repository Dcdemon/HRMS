create or replace package gld_gl_entry_pkg is

  -- Author  : DAICHAO
  -- Created : 2017/8/9 21:26:34
  -- Purpose : 凭证

  --保存总账凭证HEAD信息
  procedure gld_gl_entry_head_16206_save(p_gl_entry_head_id   in out number,
                                         p_gl_entry_code      varchar2,
                                         p_create_date        date,
                                         p_period             varchar2,
                                         p_attachement        varchar2,
                                         p_currency_code      varchar2,
                                         p_exchange_rate_type varchar2,
                                         p_exchange_rate      number,
                                         p_head_summary       varchar2,
                                         p_user_id            number);

  --提交函数
  function submit_data_check(p_gl_entry_head_id number) return varchar2;

  --提交总帐凭证数据
  procedure gld_gl_entry_head_16206_submit(p_gl_entry_head_id number);

  --审核通过总账凭证数据
  procedure gld_gl_entry_16206_approve(p_gl_entry_head_id number,
                                       p_auditor          varchar2);

  --审核驳回总账凭证数据
  procedure gld_gl_entry_16206_reject(p_gl_entry_head_id number,
                                      p_auditor          varchar2);

  --过账总账凭证数据
  procedure gld_gl_entry_16206_posting(p_gl_entry_head_id number,
                                       p_poster          varchar2);
  --插入总账凭证HEAD信息
  procedure insert_gld_gl_entry_head_16206(p_gl_entry_head_id   number,
                                           p_gl_entry_code      varchar2,
                                           p_create_date        date,
                                           p_period             varchar2,
                                           p_attachement        varchar2,
                                           p_currency_code      varchar2,
                                           p_exchange_rate_type varchar2,
                                           p_exchange_rate      number,
                                           p_head_summary       varchar2,
                                           p_user_id            number);

  --更新总账凭证HEAD信息
  procedure update_gld_gl_entry_head_16206(p_gl_entry_head_id   number,
                                           p_gl_entry_code      varchar2,
                                           p_create_date        date,
                                           p_period             varchar2,
                                           p_attachement        varchar2,
                                           p_currency_code      varchar2,
                                           p_exchange_rate_type varchar2,
                                           p_exchange_rate      number,
                                           p_head_summary       varchar2,
                                           p_user_id            number);

  --删除总账凭证HEAD信息
  procedure delete_gld_gl_entry_head_16206(p_gl_entry_head_id number,
                                           p_user_id          number);

  --插入总账凭证LINE信息
  procedure insert_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_gl_entry_head_id number,
                                           p_account_id       number,
                                           p_dr_amount        number,
                                           p_cr_amount        number,
                                           p_dr_functional    number,
                                           p_cr_functional    number,
                                           p_line_summary     varchar2,
                                           p_user_id          number);

  --更新总账凭证LINE信息
  procedure update_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_gl_entry_head_id number,
                                           p_account_id       number,
                                           p_dr_amount        number,
                                           p_cr_amount        number,
                                           p_dr_functional    number,
                                           p_cr_functional    number,
                                           p_line_summary     varchar2,
                                           p_user_id          number);

  --删除总账凭证LINE信息
  procedure delete_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_user_id          number,
                                           p_gl_entry_head_id number);

end gld_gl_entry_pkg;
/
create or replace package body gld_gl_entry_pkg is

  --保存总账凭证HEAD信息
  procedure gld_gl_entry_head_16206_save(p_gl_entry_head_id   in out number,
                                         p_gl_entry_code      varchar2,
                                         p_create_date        date,
                                         p_period             varchar2,
                                         p_attachement        varchar2,
                                         p_currency_code      varchar2,
                                         p_exchange_rate_type varchar2,
                                         p_exchange_rate      number,
                                         p_head_summary       varchar2,
                                         p_user_id            number) is
    v_gl_entry_head_id number;
  begin
    if (p_gl_entry_head_id is null or p_gl_entry_head_id = '') then
      v_gl_entry_head_id := gld_gl_entry_head_16206_s.nextval;
    
      insert_gld_gl_entry_head_16206(v_gl_entry_head_id,
                                     p_gl_entry_code,
                                     p_create_date,
                                     p_period,
                                     p_attachement,
                                     p_currency_code,
                                     p_exchange_rate_type,
                                     p_exchange_rate,
                                     p_head_summary,
                                     p_user_id);
      p_gl_entry_head_id := v_gl_entry_head_id;
    else
      update_gld_gl_entry_head_16206(v_gl_entry_head_id,
                                     p_gl_entry_code,
                                     p_create_date,
                                     p_period,
                                     p_attachement,
                                     p_currency_code,
                                     p_exchange_rate_type,
                                     p_exchange_rate,
                                     p_head_summary,
                                     p_user_id);
    end if;
  end;

  --提交函数
  function submit_data_check(p_gl_entry_head_id number) return varchar2 is
  
    /* Remind :
    return Y : means can be delete
    return N : means cannot be delete*/
  
    v_gl_entry_head_id gld_gl_entry_head_16206.gl_entry_head_id%TYPE;
  begin
    select gl_entry_head_id
      into v_gl_entry_head_id
      from gld_gl_entry_head_16206 gh
     where gh.gl_entry_head_id = p_gl_entry_head_id
       and gh.status in ('NEW', 'SUBMIT', 'REJECT', 'APPROVE', 'CONFIRM')
       for update nowait;
    return 'Y';
  exception
    when others then
      return 'N';
  END submit_data_check;

  --提交总账凭证数据
  procedure gld_gl_entry_head_16206_submit(p_gl_entry_head_id number) is
  begin
  
    if submit_data_check(p_gl_entry_head_id) = 'Y' then
      update gld_gl_entry_head_16206 gh
         set gh.status = 'SUBMIT'
       where gh.gl_entry_head_id = p_gl_entry_head_id;
    end if;
  
  end gld_gl_entry_head_16206_submit;

  --审核通过总账凭证数据
  procedure gld_gl_entry_16206_approve(p_gl_entry_head_id number,
                                       p_auditor          varchar2) is
  begin
    if submit_data_check(p_gl_entry_head_id) = 'Y' then
      update gld_gl_entry_head_16206 gh
         set gh.status = 'APPROVE', gh.auditor = p_auditor,gh.last_update_date =sysdate
       where gh.gl_entry_head_id = p_gl_entry_head_id;
    end if;
  
  end gld_gl_entry_16206_approve;

  --审核驳回总账凭证数据
  procedure gld_gl_entry_16206_reject(p_gl_entry_head_id number,
                                      p_auditor          varchar2) is
  begin
    if submit_data_check(p_gl_entry_head_id) = 'Y' then
      update gld_gl_entry_head_16206 gh
         set gh.status = 'REJECT', gh.auditor = p_auditor,gh.last_update_date =sysdate
       where gh.gl_entry_head_id = p_gl_entry_head_id;
    end if;
  
  end gld_gl_entry_16206_reject;
  
   --过账总账凭证数据
  procedure gld_gl_entry_16206_posting(p_gl_entry_head_id number,p_poster varchar2)is
       begin
    if submit_data_check(p_gl_entry_head_id) = 'Y' then
      update gld_gl_entry_head_16206 gh
         set gh.status = 'CONFIRM',gh.poster=p_poster,gh.last_update_date =sysdate
       where gh.gl_entry_head_id = p_gl_entry_head_id;
    end if;                                
  end gld_gl_entry_16206_posting;

  --插入总账凭证HEAD信息
  procedure insert_gld_gl_entry_head_16206(p_gl_entry_head_id   number,
                                           p_gl_entry_code      varchar2,
                                           p_create_date        date,
                                           p_period             varchar2,
                                           p_attachement        varchar2,
                                           p_currency_code      varchar2,
                                           p_exchange_rate_type varchar2,
                                           p_exchange_rate      number,
                                           p_head_summary       varchar2,
                                           p_user_id            number) is
    v_status varchar2(50) := 'NEW';
    v_count  number;
    e_gl_entry_code_error exception;
  begin
    --校验凭证号是否存在
    select count(*)
      into v_count
      from gld_gl_entry_head_16206 gh
     where gh.gl_entry_code = p_gl_entry_code;
    if v_count > 0 then
      raise e_gl_entry_code_error;
    end if;
  
    insert into gld_gl_entry_head_16206 gh
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
       auditor,
       documentmaker,
       creation_date,
       created_by,
       last_update_date,
       last_updated_by)
    values
      (p_gl_entry_head_id,
       p_gl_entry_code,
       p_create_date,
       p_period,
       p_attachement,
       p_currency_code,
       p_exchange_rate_type,
       p_exchange_rate,
       v_status,
       p_head_summary,
       p_user_id,
       p_user_id,
       sysdate,
       p_user_id,
       sysdate,
       p_user_id);
  
  exception
    when e_gl_entry_code_error then
      sys_raise_app_error_pkg.raise_user_define_error(p_message_code            => 'GLD5010_GLD_ENTRY_CODE_UNIQUE_ERROR',
                                                      p_created_by              => p_user_id,
                                                      p_package_name            => 'gld_gl_entry_pkg',
                                                      p_procedure_function_name => 'insert_gld_gl_entry_head_16206'
                                                      
                                                      );
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
    when others then
      sys_raise_app_error_pkg.raise_sys_others_error(p_message                 => dbms_utility.format_error_stack || ' ' ||
                                                                                  sqlerrm,
                                                     p_created_by              => p_user_id,
                                                     p_package_name            => 'gld_gl_entry_pkg',
                                                     p_procedure_function_name => 'insert_gld_gl_entry_head_16206');
      raise_application_error(sys_raise_app_error_pkg.c_error_number,
                              sys_raise_app_error_pkg.g_err_line_id);
  end;

  --更新总账凭证HEAD信息
  procedure update_gld_gl_entry_head_16206(p_gl_entry_head_id   number,
                                           p_gl_entry_code      varchar2,
                                           p_create_date        date,
                                           p_period             varchar2,
                                           p_attachement        varchar2,
                                           p_currency_code      varchar2,
                                           p_exchange_rate_type varchar2,
                                           p_exchange_rate      number,
                                           p_head_summary       varchar2,
                                           p_user_id            number) is
  begin
    update gld_gl_entry_head_16206 gh
       set gh.gl_entry_code      = p_gl_entry_code,
           gh.create_date        = p_create_date,
           gh.period             = p_period,
           gh.attachement        = p_attachement,
           gh.currency_code      = p_currency_code,
           gh.exchange_rate_type = p_exchange_rate_type,
           gh.exchange_rate      = p_exchange_rate,
           gh.head_summary       = p_head_summary,
           gh.last_update_date   = sysdate,
           gh.last_updated_by    = p_user_id
     where gh.gl_entry_head_id = p_gl_entry_head_id;
  end;

  --删除总账凭证HEAD信息
  procedure delete_gld_gl_entry_head_16206(p_gl_entry_head_id number,
                                           p_user_id          number) is
  begin
    delete_gld_gl_entry_line_16206(p_gl_entry_line_id => '',
                                   p_user_id          => p_user_id,
                                   p_gl_entry_head_id => p_gl_entry_head_id);
  
    delete from gld_gl_entry_head_16206 gh
     where gh.gl_entry_head_id = p_gl_entry_head_id;
  end;

  --插入总账凭证LINE信息
  procedure insert_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_gl_entry_head_id number,
                                           p_account_id       number,
                                           p_dr_amount        number,
                                           p_cr_amount        number,
                                           p_dr_functional    number,
                                           p_cr_functional    number,
                                           p_line_summary     varchar2,
                                           p_user_id          number) is
  begin
    insert into gld_gl_entry_line_16206 gl
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
      (gld_gl_entry_line_16206_s.nextval,
       p_gl_entry_head_id,
       p_account_id,
       p_dr_amount,
       p_cr_amount,
       p_dr_functional,
       p_cr_functional,
       sysdate,
       p_user_id,
       sysdate,
       p_user_id,
       p_line_summary);
  end;

  --更新总账凭证LINE信息
  procedure update_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_gl_entry_head_id number,
                                           p_account_id       number,
                                           p_dr_amount        number,
                                           p_cr_amount        number,
                                           p_dr_functional    number,
                                           p_cr_functional    number,
                                           p_line_summary     varchar2,
                                           p_user_id          number) is
  begin
    update gld_gl_entry_line_16206 gl
       set gl.gl_entry_head_id = p_gl_entry_head_id,
           gl.account_id       = p_account_id,
           gl.dr_amount        = p_dr_amount,
           gl.cr_amount        = p_cr_amount,
           gl.dr_functional    = p_dr_functional,
           gl.cr_functional    = p_cr_functional,
           gl.last_update_date = sysdate,
           gl.last_updated_by  = p_user_id,
           gl.line_summary     = p_line_summary
     where gl.gl_entry_line_id = p_gl_entry_line_id;
  end;

  --删除总账凭证LINE信息
  procedure delete_gld_gl_entry_line_16206(p_gl_entry_line_id number,
                                           p_user_id          number,
                                           p_gl_entry_head_id number) is
  begin
    if p_gl_entry_line_id is not null and p_gl_entry_head_id is not null then
      --删除某个凭证下的某条行LINE信息
      delete from gld_gl_entry_line_16206 gl
       where gl.gl_entry_line_id = p_gl_entry_line_id
         and gl.gl_entry_head_id = p_gl_entry_head_id;
    
    elsif p_gl_entry_line_id is null and p_gl_entry_head_id is not null then
      --删除某条HEAD下的所有LINE信息
      for cur_gld_lines in (select gl.gl_entry_line_id
                              from gld_gl_entry_line_16206 gl
                             where gl.gl_entry_head_id = p_gl_entry_head_id) loop
      
        DELETE FROM gld_gl_entry_line_16206 gl
         where gl.gl_entry_line_id = cur_gld_lines.gl_entry_line_id;
      end loop;
    end if;
  
  end;
end gld_gl_entry_pkg;
/
