function [dir_spec, spec_name] = set_spec_alg_name(dir_exp, momtype, K, dataname, c0)
  spec_name = strcat('spec',momtype);
  spec_name = strcat(spec_name,'_K',num2str(K));
  if strcmp(momtype,'lda')
    spec_name = strcat(spec_name,'_c0',double_to_string(c0));
  end
  spec_name = strcat(spec_name,'_',dataname);
  
  dir_spec = strcat(dir_exp,'/',spec_name);
end
