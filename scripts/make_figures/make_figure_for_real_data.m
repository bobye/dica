function make_figure_for_real_data(dir_root, data_type)

  dir_plots = strcat(dir_root,'/plots');
  if exist(dir_plots,'dir') ~= 7
    mkdir(dir_plots)
  end

  dir_data = strcat('data/real/', data_type);
  dir_exp = strcat(dir_root,'/',data_type);
  nfolds = 5;
  nalg = 6;
  Ks = [10 50:50:200];

  opts_exp = struct();
  opts_exp(1).jd_type = 'default';
  opts_exp(1).jd_isrand = 0;
  opts_exp(1).dir_exp = dir_exp;
  opts_exp(1).dir_data = dir_data;
  
  % load and prepare the data
  [xs, ys, ys_L, ys_U] = load_evaluations_for_real_data(opts_exp,data_type,Ks,nalg,nfolds);
  
  % make lines/algorithms options
  algopts = make_algopts(nalg);
  
  % make plot options
  plotopts = make_default_plotopts;
  
  plotopts.yname = 'Log-likelihood (in bits)';
  plotopts.xname = 'Topics $K$';
  plotopts.isxlim = 1;
  plotopts.xlims = [xs(1)-1 xs(end)+1];
  plotopts.isxticks = 1;
  plotopts.xticks = xs;
  
  plotopts.isylim = 0;
  
  plotopts.plotname2save = [dir_plots,'/',data_type,'_eval'];
  make_single_plot(xs, ys, ys_L, ys_U, algopts, plotopts)
  
end

function algopts = make_algopts(nalg)
  algopts.nalg = nalg;
  algopts.algspecs = {'-', '-', ':', ':', '--', '--'};
  grey = [.3 .3 .3];
  lgrey = [.5 .5 .5]; 
  orange = [.8 .3 0];
  lorange = [.9  .5 0];
  green =  [.1 .4 .1];
  lgreen = [.2 .5 .2];
  algopts.algcolors = {orange, grey, lorange, lgrey, green, green};
  algopts.markers = {'o', 'd', '*', '*', 'p', 'h'};
  algopts.markcols = {lorange, lgrey, 'w', 'w', lgreen, lgreen};
  algopts.marksizes = {30, 30, 30, 30, 30, 30};
  algopts.algnames = {'JD-GP', 'JD-LDA', 'Spec-GP', 'Spec-LDA', 'VI', 'VI-JD'};  
end

function [xs, ys, ys_L, ys_U] = load_evaluations_for_real_data(opts_exp,data_type,Ks,nalg,nfolds)
  xs = Ks;
  len_x = length(Ks);
  
  dir_exp = opts_exp.dir_exp;
  dir_data = opts_exp.dir_data;
  
  ys   = zeros(len_x, nalg);
  ys_L = zeros(len_x, nalg);
  ys_U = zeros(len_x, nalg);
  
  % JD-GP
  for i = 1:len_x
    K = Ks(i);
    
    temp = zeros(nfolds,nalg);
    for ifold = 1:nfolds
      dataname = strcat( data_type,'_',num2str(ifold) );
      
      load( strcat(dir_data,'/',dataname) )
      num_tokens = sum(sum(test));
      test_size = size(test,2);
      
      % JD-GP
      opts = set_jd_opts(opts_exp);
      [~, jd_name] = set_jd_alg_name(dir_exp, 'dica', opts, K, dataname);
      load( strcat(dir_exp,'/eval_',jd_name) )
      temp(ifold, 1) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
      
      % load c0
      dir_vi = strcat( dir_exp,'/vi_',dataname,'_K', num2str(K) );
      load( dir_vi )
      c0 = sum(cest);
      
      % JD-LDA
      opts = set_jd_opts(opts_exp);
      opts(1).c0 = c0;
      [~, jd_name] = set_jd_alg_name(dir_exp, 'lda', opts, K, dataname);
      load( strcat(dir_exp,'/eval_',jd_name) )
      temp(ifold, 2) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
      
      % Spec-GP
      [~, spec_name] = set_spec_alg_name(dir_exp, 'dica', K, dataname);
      load( strcat(dir_exp,'/eval_',spec_name) )
      temp(ifold, 3) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
      
      % Spec-LDA
      [~, spec_name] = set_spec_alg_name(dir_exp, 'lda', K, dataname, c0);
      load( strcat(dir_exp,'/eval_',spec_name) )
      temp(ifold, 4) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
      
      % VI
      [~, vi_name] = set_vi_alg_name(dir_exp,K,dataname);
      load( strcat(dir_exp,'/eval_',vi_name) )
      temp(ifold, 5) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
      
      % VI-JD
      [~, viw_name] = set_vi_warm_alg_name(dir_exp,dataname,K,'dica');
      load( strcat(dir_exp,'/eval_',viw_name) )
      temp(ifold, 6) = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens);
      clear( 'chiblik' )
    end
    
    ys(i, :) = mean(temp);
    ys_L(i, :) = std(temp);
    ys_U(i, :) = std(temp);
  end
  
end

function evals = estimate_log_likelihood_in_bits(chiblik,test_size,num_tokens)
      evals = chiblik * test_size /num_tokens;
      evals = evals / log(2);
      evals = evals / test_size;
end
