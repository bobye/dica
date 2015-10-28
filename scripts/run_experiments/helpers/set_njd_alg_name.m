function [dir_njd, njd_name] = set_njd_alg_name(dir_exp, momtype, opts, K, dataname)
  type = opts.type;
  P = K;
  if strcmp(type,'random'), P = opts.P; end
  
  jd_name = strcat('njd',momtype,'_type_',type);
  jd_name = strcat(jd_name,'_P',num2str(P));
  jd_name = strcat(jd_name,'_K',num2str(K));
  if strcmp(momtype,'lda')
    jd_name = strcat(jd_name,'_c0',double_to_string(opts.c0));
  end
  njd_name = strcat(jd_name,'_',dataname);
  
  dir_njd = strcat(dir_exp,'/',njd_name);
end
