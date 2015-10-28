function script_run_experiment_and_evaluation_for_real_data(dir_root, data_type)
%SCRIPT_RUN_EXPERIMENT_AND_EVALUATION_FOR_REAL_DATA
  
  % for reproducibility
  rng('default')
  rng(1)

  dir_data = strcat('data/real/', data_type);
  dir_exp = strcat(dir_root,'/',data_type);
  nfolds = 5;
  Ks = [10 50:50:200];

  opts_exp = struct();
  opts_exp(1).jd_type = 'default';
  opts_exp(1).jd_isrand = 0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_data;
  
  algs = {'jd-dica', 'spec_dica', 'vi'};
  for K = Ks
    for ifold = 1:nfolds
      dataname = strcat(data_type,'_',num2str(ifold));
      run_experiment(algs, opts_exp, dataname, K)
      run_evaluation(algs, opts_exp, dataname, K)
    end
  end
  
  algs = {'jd-lda', 'spec-lda', 'vi-warm-dica'};
  for K = Ks
    for ifold = 1:nfolds
      dataname = strcat(data_type,'_',num2str(ifold));
      vi_name = strcat(dir_exp,'/vi_',dataname,'_K', num2str(K));
      load( vi_name, 'cest' )
      opts_exp(1).c0 = sum(cest);
      run_experiment(algs, opts_exp, dataname, K)
      run_evaluation(algs, opts_exp, dataname, K)
    end
  end
  
  
end