function dir_jd_full = set_jd_full_alg_name(dir_exp, momtype, opts, K, dataname)
  isrand = opts.isrand;
  nruns = 1;
  if isrand == 1, nruns = opts.nruns; end
  
  dir_alg = strcat(dir_exp,'/jdfull',momtype);
  dir_alg = strcat(dir_alg,'_isrand',num2str(isrand));
  dir_alg = strcat(dir_alg,'_nruns',num2str(nruns));
  dir_alg = strcat(dir_alg,'_K',num2str(K));
  if strcmp(momtype,'lda')
    dir_alg = strcat(dir_alg,'_c0',double_to_string(opts.c0));
  end
  dir_jd_full = strcat(dir_alg,'_',dataname);
end
