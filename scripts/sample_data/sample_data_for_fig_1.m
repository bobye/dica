function sample_data_for_fig_1(dir_root)
%SAMPLE_DATA_FOR_FIG_1 Samples the semi toy data as the one on Figure 1 of 
% our Arxiv paper.
% 
% sample_data_for_fig_1(dir_root)
%
% Input:
%   dir_root : the path to the directory where the data will be stored

% Copyright 2015, Anastasia Podosinnikova

  % for reproducibility
  rng('default')
  rng(1)

  dir_fig1 = strcat(dir_root,'/fig_1');
  mkdir(dir_fig1)

  [~,D,c,K,~,M,Ns,b,nruns] = get_parameters_for_fig_1;

  for N = Ns
    for irun = 1:nruns
      
      disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun)])
      sample_from_gp_model_and_save(dir_fig1,irun,K,M,N,D,c,b);
      
    end
  end

end
