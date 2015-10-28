function [dir_vi, vi_name] = set_vi_alg_name(dir_exp, K, dataname)
  vi_name = strcat('vi_',dataname,'_K', num2str(K));
  dir_vi = strcat(dir_exp,'/',vi_name);
end
