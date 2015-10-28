function [dir_jd, jd_name] = set_jd_alg_name(dir_exp, momtype, opts, K, dataname)
  type = opts.type;
  P = K;
  if strcmp(type,'random'), P = opts.P; end
  isrand = opts.isrand;
  nruns = 1;
  if isrand == 1, nruns = opts.nruns; end
  
  jd_name = strcat('jd',momtype,'_type_',type);
  jd_name = strcat(jd_name,'_P',num2str(P));
  jd_name = strcat(jd_name,'_isrand',num2str(isrand));
  jd_name = strcat(jd_name,'_nruns',num2str(nruns));
  jd_name = strcat(jd_name,'_K',num2str(K));
  if strcmp(momtype,'lda')
    jd_name = strcat(jd_name,'_c0',double_to_string(opts.c0));
  end
  jd_name = strcat(jd_name,'_',dataname);
  
  dir_jd = strcat(dir_exp,'/',jd_name);
end
