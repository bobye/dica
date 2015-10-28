function compute_allerrors_for_fig_5_right(dir_root)
  exp_name = 'fig_5_right';
  [~,D1,~,K1,D2,~,K2,~,~,N,nruns] = get_parameters_for_fig_5_right;
  compute_allerrors_for_fig_5(dir_root,exp_name,D1,K1,D2,K2,N,nruns)
end
