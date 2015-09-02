function sample_data_for_fig_1
%SAMPLE_DATA_FOR_FIG_1

% Copyright 2015, Anastasia Podosinnikova

   dir_root = 'data/experiments/fig_1';
   mkdir(dir_root);
   
   temp = load('data/topic_matrices/params_ap_K50.mat');
   D = temp.D;
   [M, K] = size(D);
   c = temp.c;
   
   % scale c to sum to 0.5
   c = 0.5 * (c/sum(c));
   
   % expected document length 
   L = 200;
   b = sum(c) / L;
   
   nruns = 5;
   Ns = [1000 10000:10000:50000];
   
   for N = Ns
     for irun = 1:nruns
       disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun)])
       SX = sample_from_gp_model(K, M, N, D, c, b);
       save(strcat(dir_root,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
     end
   end
   
end