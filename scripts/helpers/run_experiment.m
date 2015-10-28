function run_experiment(algs, opts_exp, dataname, K)
%RUN_EXPERIMENT Auxilliary method to launch algorithm/s. Useful for running
% algorithms in parallel.

% Copyright 2015, Anastasia Podosinnikova

  dir_data = opts_exp.dir_data;
  load(strcat(dir_data,'/',dataname,'.mat'))
  dir_exp = opts_exp.dir_exp;
  
  if sum(strcmp(algs,'vi')) > 0
    nruns = 1;
    startoption = 'seeded';
    is_estimate_alpha = 1;
    tt = tic;
      dir_files =  strcat(dir_exp,'/vi_',dataname,'_K',num2str(K));
      [Dest, cest] = vi_lda(...
          dir_data,dir_exp,dir_files,dataname,K,nruns,startoption,is_estimate_alpha);
    time = toc(tt);
    [dir_save, ~] = set_vi_alg_name(dir_exp, K, dataname);
    save( dir_save, 'Dest', 'cest', 'time' )
  end
  
  if sum(strcmp(algs,'vi-warm-dica')) > 0
    opts = set_jd_opts(opts_exp);
    [dir_jd, jd_name] = set_jd_alg_name(dir_exp, 'dica', opts, K, dataname);
    if exist(strcat(dir_jd,'.mat'), 'file') == 2
      load( dir_jd, 'Dest', 'cest' )
      save_D_and_c_to_LDA_model_format(dir_exp, jd_name, Dest, cest);
      tt = tic;
        startoption = strcat('model=',dir_jd);
        nruns = 1;
        is_estimate_alpha = 1;
        dir_files =  strcat(dir_exp,'/vi_warm_dica_',dataname,'_K',num2str(K));
        [Dest, cest] = vi_lda(...
            dir_data,dir_exp,dir_files,dataname,K,nruns,startoption,is_estimate_alpha);
      time = toc(tt);
      [dir_save, ~] = set_vi_warm_alg_name(dir_exp,dataname,K,'dica');
      save( dir_save, 'Dest', 'cest', 'time' )
    else
      error('vi-warm-dica was not successful')
    end
  end
  
  if sum(strcmp(algs,'njd-dica')) > 0
    opts = set_jd_opts(opts_exp);
    momtype = 'dica';
    mu = 1;
    tt=tic; Dest = njd_with_manopt(SX, mu, K, momtype, opts); time=toc(tt);
    dir_save = set_njd_alg_name(dir_exp, momtype, opts, K, dataname);
    save( dir_save, 'Dest', 'opts', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'jd-dica')) > 0
    opts = set_jd_opts(opts_exp);
    momtype = 'dica';
    tic; [Dest, cest] = jd(SX, K, momtype, opts); time=toc;
    dir_save = set_jd_alg_name(dir_exp, momtype, opts, K, dataname);
    save( dir_save, 'Dest', 'cest', 'opts', 'K', 'time' )
  end

  if sum(strcmp(algs,'jd-lda')) > 0
    opts = set_jd_opts(opts_exp);
    if ~isfield(opts,'c0'), error('Wrong opts_exp.c0'), end
    momtype = 'lda';
    c0 = opts.c0;
    tic; [Dest, cest] = jd(SX, K, momtype, opts, c0); time=toc;
    dir_save = set_jd_alg_name(dir_exp, momtype, opts, K, dataname);
    save( dir_save, 'Dest', 'cest', 'opts', 'c0', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'jd-full-dica')) > 0
    opts = set_jd_full_opts(opts_exp);
    momtype = 'dica';
    tic; Dest = jd_full_basis(SX, K, momtype, opts); time=toc;
    dir_save = set_jd_full_alg_name(dir_exp, momtype, opts, K, dataname);
    save( dir_save, 'Dest', 'opts', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'jd-full-lda')) > 0
    opts = set_jd_full_opts(opts_exp);
    if ~isfield(opts,'c0'), error('Wrong opts_exp.c0'), end
    momtype = 'lda';
    c0 = opts.c0;
    tic; Dest = jd_full_basis(SX, K, momtype, opts, c0); time=toc;
    dir_save = set_jd_full_alg_name(dir_exp, momtype, opts, K, dataname);
    save( dir_save, 'Dest', 'opts', 'c0', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'spec-dica'))>0
    momtype = 'dica';
    tic; [Dest, cest] = spectral(SX, K, momtype); time=toc;
    dir_save = set_spec_alg_name(dir_exp, momtype, K, dataname);
    save( dir_save, 'Dest', 'cest', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'spec-lda'))>0
    momtype = 'lda';
    if ~isfield(opts_exp,'c0'), error('Wrong opts_exp.c0'), end
    c0 = opts_exp.c0;
    tic; [Dest, cest] = spectral(SX, K, momtype, c0); time=toc;
    dir_save = set_spec_alg_name(dir_exp, momtype, K, dataname, c0);
    save( dir_save, 'Dest','cest', 'c0', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'tpm-dica'))>0
    momtype = 'dica';
    tic; Dest = tpm(SX, K, momtype); time=toc;
    dir_save = set_tpm_alg_name(dir_exp, momtype, K, dataname);
    save( dir_save, 'Dest', 'K', 'time' )
  end
  
  if sum(strcmp(algs,'tpm-lda'))>0
    momtype = 'lda';
    if ~isfield(opts_exp,'c0'), error('Wrong opts_exp.c0'), end
    c0 = opts_exp.c0;
    tic; Dest = tpm(SX, K, momtype, c0); time=toc;
    dir_save = set_tpm_alg_name(dir_exp, momtype, K, dataname, c0);
    save( dir_save, 'Dest', 'c0', 'K', 'time' )
  end

end
