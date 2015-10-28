function script_run_experiment_for_fig_1(dir_root)
%SCRIPT_RUN_EXPERIMENT_FOR_FIG_1

  % for reproducibility
  rng('default')
  rng(1)

  [c0,~,~,K,~,~,Ns,~,nruns] = get_parameters_for_fig_1;
  dir_exp = strcat(dir_root,'/fig_1');

  % run JD
  opts_exp = struct();
  opts_exp(1).jd_type = 'default';
  opts_exp(1).jd_isrand = 0;
  opts_exp(1).c0 = c0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_exp;
  algs = {'jd-dica', 'jd-lda'};

  disp('Starting JD for DICA and LDA ...')
  for N = Ns
    for irun = 1:nruns
      disp(['N = ',num2str(N),', irun = ',num2str(irun)])
      dataname = strcat('dataN',num2str(N),'irun',num2str(irun));
      run_experiment(algs, opts_exp, dataname, K)
    end
  end

  % run JD(k)
  opts_exp = struct();
  opts_exp(1).jd_type = 'random';
  opts_exp(1).jd_P = K;
  opts_exp(1).jd_isrand = 0;
  opts_exp(1).c0 = c0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_exp;
  algs = {'jd-dica', 'jd-lda'};

  disp('Starting JD(k) for DICA and LDA ...')
  for N = Ns
    for irun = 1:nruns
      disp(['N = ',num2str(N),', irun = ',num2str(irun)])
      dataname = strcat('dataN',num2str(N),'irun',num2str(irun));
      run_experiment(algs, opts_exp, dataname, K)
    end
  end

  % run Spec and TPM
  opts_exp = struct();
  opts_exp.c0 = c0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_exp;
  algs = {'spec-dica', 'spec-lda', 'tpm-dica', 'tpm-lda'};

  disp('Starting Spec and TPM for DICA and LDA ...')
  for N = Ns
    for irun = 1:nruns
      disp(['N = ',num2str(N),', irun = ',num2str(irun)])
      dataname = strcat('dataN',num2str(N),'irun',num2str(irun));
      run_experiment(algs, opts_exp, dataname, K)
    end
  end

  % run JD(f)
  opts_exp = struct();
  opts_exp(1).jd_isrand = 0;
  opts_exp(1).c0 = c0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_exp;
  algs = {'jd-full-dica', 'jd-full-lda'};

  disp('Starting JD(f) for DICA and LDA ...')
  for N = Ns
    for irun = 1:nruns
      disp(['N = ',num2str(N),', irun = ',num2str(irun)])
      dataname = strcat('dataN',num2str(N),'irun',num2str(irun));
      run_experiment(algs, opts_exp, dataname, K)
    end
  end
  
  compute_allerrors_for_fig_1(dir_root)

end
