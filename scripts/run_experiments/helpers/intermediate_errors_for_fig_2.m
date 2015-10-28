function [l1, l2, tt] = intermediate_errors_for_fig_2(...
                       nalg,dat,dir_exp_1,dir_exp_2,c0,D1,K1,D2,K2,nruns)
  
  % JD
  opts_jd = struct();
  opts_jd(1).type = 'default';
  opts_jd(1).isrand = 0;
  opts_jd(1).c0 = c0;
  
  tt = zeros(nruns,nalg);
  l1 = zeros(nruns,nalg);
  l2 = zeros(nruns,nalg);
  
  for irun = 1:nruns
    dataname = strcat(dat,'irun',num2str(irun));

    dir_alg = set_jd_alg_name(dir_exp_1, 'dica', opts_jd, K1, dataname);
    [l1, l2, tt] = update_errors_and_times(l1, l2, tt, irun, 1, D1, dir_alg);

    dir_alg = set_jd_alg_name(dir_exp_1, 'lda', opts_jd, K1, dataname);
    [l1, l2, tt] = update_errors_and_times(l1, l2, tt, irun, 2, D1, dir_alg);

    dir_alg = set_jd_alg_name(dir_exp_2, 'dica', opts_jd, K2, dataname);
    [l1, l2, tt] = update_errors_and_times(l1, l2, tt, irun, 3, D2, dir_alg);

    dir_alg = set_jd_alg_name(dir_exp_2, 'lda', opts_jd, K2, dataname);
    [l1, l2, tt] = update_errors_and_times(l1, l2, tt, irun, 4, D2, dir_alg);
    
  end
  
end

function [l1, l2, tt] = update_errors_and_times(l1, l2, tt, irun, ialg, D, dir_alg)
  load( dir_alg, 'Dest', 'time' )
  l2(irun,ialg) = l2_error(Dest, D);
  l1(irun,ialg) = l1_error(Dest, D);
  tt(irun,ialg) = time;
end
