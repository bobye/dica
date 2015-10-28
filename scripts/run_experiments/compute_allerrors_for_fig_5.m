function compute_allerrors_for_fig_5(dir_root,exp_name,D1,K1,D2,K2,N,nruns)
  c0s = [0.01 0.01 1 10 100];
  len = length(c0s);
  nalg = 4;
  dir_exp_1 = strcat(dir_root,'/',exp_name,'/K',num2str(K1));
  dir_exp_2 = strcat(dir_root,'/',exp_name,'/K',num2str(K2));
  
  times = cell(len,1);
  l1errors = cell(len,1);
  
  for i = 1:len
    c0 = c0s(i);
     % JD
    opts_jd = struct();
    opts_jd(1).type = 'default';
    opts_jd(1).isrand = 0;
    opts_jd(1).c0 = c0;
    
    tt = zeros(nruns,nalg);
    l1 = zeros(nruns,nalg);
    
    for irun = 1:nruns
      dataname = strcat('dataN',num2str(N),'irun',num2str(irun));

      alg_dir = set_jd_alg_name(dir_exp_1, 'dica', opts_jd, K1, dataname);
      [l1, tt] = update_errors_and_times(l1, tt, irun, 1, D1, alg_dir);

      alg_dir = set_jd_alg_name(dir_exp_1, 'lda', opts_jd, K1, dataname);
      [l1, tt] = update_errors_and_times(l1, tt, irun, 2, D1, alg_dir);

      alg_dir = set_jd_alg_name(dir_exp_2, 'dica', opts_jd, K2, dataname);
      [l1, tt] = update_errors_and_times(l1, tt, irun, 3, D2, alg_dir);

      alg_dir = set_jd_alg_name(dir_exp_2, 'lda', opts_jd, K2, dataname);
      [l1, tt] = update_errors_and_times(l1, tt, irun, 4, D2, alg_dir);

    end
  
    times{i} = tt;
    l1errors{i} = l1;
  
  end
  
  save( strcat(dir_root,'/plots/allerr_',exp_name), 'times', 'l1errors' )
  
end

function [l1, tt] = update_errors_and_times(l1, tt, irun, ialg, D, alg_dir)
      load( alg_dir, 'Dest', 'time')
      l1(irun,ialg) = l1_error(Dest, D);
      tt(irun,ialg) = time;
end
