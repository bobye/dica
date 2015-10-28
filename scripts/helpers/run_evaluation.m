function run_evaluation(algs, opts_exp, dataname, K)
%RUN_EVALUATION Auxilliary function for evalution of real data experiments.
% Useful when evaluation experiments in parallel.

% Copyright 2015, Anastasia Podosinnikova

  dir_data = opts_exp.dir_data;
  load(strcat(dir_data,'/',dataname,'.mat'))
  dir_exp = opts_exp.dir_exp;
  
  if sum(strcmp(algs,'jd-dica')) > 0
    opts = set_jd_opts(opts_exp);
    momtype = 'dica';
    [dir_jd, jd_name] = set_jd_alg_name(dir_exp, momtype, opts, K, dataname);
    load( dir_jd, 'Dest', 'cest' )
    [chiblik, chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',jd_name), 'chiblik', 'chibtime' )
  end
 
  if sum(strcmp(algs,'jd-lda')) > 0
    dir_vi = strcat(dir_exp,'/vi_',dataname,'_K', num2str(K));
    load(dir_vi)
    c0 = sum(cest);
    opts = set_jd_opts(opts_exp);
    opts(1).c0 = c0;
    momtype = 'lda';
    [dir_jd, jd_name] = set_jd_alg_name(dir_exp, momtype, opts, K, dataname);
    load( dir_jd, 'Dest', 'cest' )
    [chiblik, chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',jd_name), 'chiblik', 'chibtime' )
  end

  if sum(strcmp(algs,'spec-dica')) > 0
    momtype = 'dica';
    [dir_alg, spec_name] = set_spec_alg_name(dir_exp, momtype, K, dataname);
    load(dir_alg,'Dest','cest')
    [chiblik, chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',spec_name), 'chiblik', 'chibtime' )
  end

  if sum(strcmp(algs,'spec-lda')) > 0
    dir_vi = strcat(dir_exp,'/vi_',dataname,'_K', num2str(K));
    load(dir_vi)
    c0 = sum(cest);
    momtype = 'lda';
    [dir_alg, spec_name] = set_spec_alg_name(dir_exp, momtype, K, dataname, c0);
    load(dir_alg,'Dest','cest')
    [chiblik, chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',spec_name), 'chiblik', 'chibtime' )
  end

  if sum(strcmp(algs,'vi')) > 0
    [dir_vi, vi_name] = set_vi_alg_name(dir_exp, K, dataname);
    load(dir_vi)
    [chiblik, chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',vi_name), 'chiblik', 'chibtime' )
  end

  if sum(strcmp(algs,'vi-warm-dica')) > 0
    [dir_viw, viw_name] = set_vi_warm_alg_name(dir_exp,dataname,K,'dica');
    load(dir_viw)
    [chiblik chibtime] = compute_chibevaluation(Dest,cest,test);
    save( strcat(dir_exp,'/eval_',viw_name), 'chiblik', 'chibtime' )
  end

end
