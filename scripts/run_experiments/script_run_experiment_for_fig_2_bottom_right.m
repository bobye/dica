function script_run_experiment_for_fig_2_bottom_right(dir_root)
%SCRIPT_RUN_EXPERIMENT_FOR_FIG_2_BOTTOM_RIGHT

  % for reproducibility
  rng('default')
  rng(1)

  [c0,~,~,K1,~,~,K2,~,~,~,~,gams,nruns] = get_parameters_for_fig_2_bottom_rigth;
  dir_exp_1 = strcat(dir_root,'/fig_2_bottom_right/K10');
  
  dir_exp_2 = strcat(dir_root,'/fig_2_bottom_right/K90');
  
  % run JD
  opts_exp_1 = struct();
  opts_exp_1(1).jd_type = 'default';
  opts_exp_1(1).jd_isrand = 0;
  opts_exp_1(1).c0 = c0;
  opts_exp_1(1).dir_exp = dir_exp_1;
  opts_exp_1(1).dir_data = dir_exp_1;
  
  opts_exp_2 = struct();
  opts_exp_2(1).jd_type = 'default';
  opts_exp_2(1).jd_isrand = 0;
  opts_exp_2(1).c0 = c0;
  opts_exp_2(1).dir_exp = dir_exp_2;
  opts_exp_2(1).dir_data = dir_exp_2;
  
  algs = {'jd-dica', 'jd-lda'};

  disp('Starting JD ...')
  for gam = gams
    for irun = 1:nruns
      dataname = strcat('data_gam',double_to_string(gam),'irun',num2str(irun));
      run_experiment(algs, opts_exp_1, dataname, K1)
      run_experiment(algs, opts_exp_2, dataname, K2)
    end
  end
  
  compute_allerrors_for_fig_2_bottom_right(dir_root)

end
