function sample_data_for_fig_5_left(dir_root)
%SAMPLE_DATA_FOR_FIG_5_LEFT Samples the semi toy data as the one on Figure
% 5 (left) of our paper.
%
%  sample_data_for_fig_5_left(dir_root)
%
% Input:
%   dir_root : the path to the directory where the data will be stored

% Copyright 2015, Anastasia Podosinnikova

  % for reproducibility
  rng('default')
  rng(1)

  dir_exp_1 = strcat(dir_root,'/fig_5_left/K10');
  mkdir(dir_exp_1)

  dir_exp_2 = strcat(dir_root,'/fig_5_left/K50');
  mkdir(dir_exp_2)

  [~,D1,c1,K1,D2,c2,K2,~,M,N,b,nruns] = get_parameters_for_fig_5_left;

  for irun = 1:nruns

    disp(['sampling for irun = ',num2str(irun),', K = 10'])
    sample_from_gp_model_and_save(dir_exp_1,irun,K1,M,N,D1,c1,b);

    disp(['sampling for irun = ',num2str(irun),', K = 50'])
    sample_from_gp_model_and_save(dir_exp_2,irun,K2,M,N,D2,c2,b);

  end

end
