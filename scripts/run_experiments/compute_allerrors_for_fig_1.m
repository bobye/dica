function compute_allerrors_for_fig_1(dir_root)
  [c0,D,~,K,~,~,Ns,~,nruns] = get_parameters_for_fig_1;
  len = length(Ns);
  nalg = 5;
  dir_exp = strcat(dir_root,'/fig_1');
  
  times_left_cell = cell(len,1);
  l1err_left_cell = cell(len,1);
  
  times_right_cell = cell(len,1);
  l1err_right_cell = cell(len,1);
  
  for i = 1:len
    N = Ns(i);
    
    % left
    momtype = 'dica';
    [l1, tt] = load_data_and_compute(momtype, nruns, nalg, N, dir_exp, K, D, c0);
    times_left_cell{i} = tt;
    l1err_left_cell{i} = l1;
    
    % right
    momtype = 'lda';
    [l1, tt] = load_data_and_compute(momtype, nruns, nalg, N, dir_exp, K, D, c0);
    times_right_cell{i} = tt;
    l1err_right_cell{i} = l1;
  end
  
  times = times_left_cell;
  l1errors = l1err_left_cell;
  save( strcat(dir_root,'/plots/allerr_fig_1_left'), 'times', 'l1errors' )
  
  times = times_right_cell;
  l1errors = l1err_right_cell;
  save( strcat(dir_root,'/plots/allerr_fig_1_right'), 'times', 'l1errors' )
  
end

function [l1, tt] = load_data_and_compute(momtype, nruns, nalg, N, dir_exp, K, D, c0)
  % JD
  opts_jd = struct();
  opts_jd(1).type = 'default';
  opts_jd(1).isrand = 0;
  opts_jd(1).c0 = c0;
  
  % JD(k)
  opts_jdk = struct();
  opts_jdk(1).type = 'random';
  opts_jdk(1).P = K;
  opts_jdk(1).isrand = 0;
  opts_jdk(1).c0 = c0;
  
  % run JD(f)
  opts_jdf = struct();
  opts_jdf(1).isrand = 0;
  opts_jdf(1).c0 = c0;

  tt = zeros(nruns,nalg);
  l1 = zeros(nruns,nalg);
  for irun = 1:nruns
    dataname = strcat('dataN',num2str(N),'irun',num2str(irun));

    dir_alg = set_jd_alg_name(dir_exp, momtype, opts_jd, K, dataname);
    [l1, tt] = update_errors_and_times(l1, tt, irun, 1, D, dir_alg);

    dir_alg = set_jd_alg_name(dir_exp, momtype, opts_jdk, K, dataname);
    [l1, tt] = update_errors_and_times(l1, tt, irun, 2, D, dir_alg);

    dir_alg = set_jd_full_alg_name(dir_exp, momtype, opts_jdf, K, dataname);
    [l1, tt] = update_errors_and_times(l1, tt, irun, 3, D, dir_alg);

    dir_alg = set_spec_alg_name(dir_exp, momtype, K, dataname, c0);
    [l1, tt] = update_errors_and_times(l1, tt, irun, 4, D, dir_alg);

    dir_alg = set_tpm_alg_name(dir_exp, momtype, K, dataname, c0);
    [l1, tt] = update_errors_and_times(l1, tt, irun, 5, D, dir_alg);
  end
  
end

function [l1, tt] = update_errors_and_times(l1, tt, irun, ialg, D, dir_alg)
  load( dir_alg, 'Dest', 'time' )
  l1(irun,ialg) = l1_error(Dest, D);
  tt(irun,ialg) = time;
end
