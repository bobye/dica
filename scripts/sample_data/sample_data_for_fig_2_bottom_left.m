function sample_data_for_fig_2_bottom_left(dir_root)
%SAMPLE_DATA_FOR_FIG_2_BOTTOM_LEFT Samples the semi toy data as the one on
% Figure 2 (bottom, left) of our Arxiv paper.
%
% sample_data_for_fig_2_bottom_left(dir_root)
%
% Input:
%   dir_root : the path to the directory where the data will be stored

% Copyright 2015, Anastasia Podosinnikova

  % for reproducibility
  rng('default')
  rng(1)

  dir_exp_1 = strcat(dir_root,'/fig_2_bottom_left/K10');
  mkdir(dir_exp_1)

  dir_exp_2 = strcat(dir_root,'/fig_2_bottom_left/K90');
  mkdir(dir_exp_2)

  [~,D1,c1,K1,D2,c2,K2,L1,L2,M,Ns,gam,nruns] = get_parameters_for_fig_2_bottom_left;

  for N = Ns
    for irun = 1:nruns

      disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun),', K = 10'])
      sample_from_lda_fix_2_model_and_save(dir_exp_1,irun,K1,M,N,gam,L1,L2,D1,c1);

      disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun),', K = 90'])
      sample_from_lda_fix_2_model_and_save(dir_exp_2,irun,K2,M,N,gam,L1,L2,D2,c2);

    end
  end

end
