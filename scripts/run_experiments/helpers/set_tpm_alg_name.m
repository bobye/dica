function dir_tpm = set_tpm_alg_name(dir_exp, momtype, K, dataname, c0)
  dir_alg = strcat(dir_exp,'/tpm',momtype);
  dir_alg = strcat(dir_alg,'_K',num2str(K));
  if strcmp(momtype,'lda')
    dir_alg = strcat(dir_alg,'_c0',double_to_string(c0));
  end
  dir_tpm = strcat(dir_alg,'_',dataname);
end
