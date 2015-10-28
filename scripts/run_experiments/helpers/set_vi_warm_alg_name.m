function [dir_viw, viw_name] = set_vi_warm_alg_name(dir_exp,dataname,K,momtype)
  viw_name = strcat('viwarm_',momtype,'_',dataname,'K',num2str(K));
  dir_viw = strcat(dir_exp,'/',viw_name);
end