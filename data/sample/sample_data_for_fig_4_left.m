function sample_data_for_fig_4_left
%SAMPLE_DATA_FOR_FIG_4_LEFT

% Copyright 2015, Anastasia Podosinnikova
  
   dir_root1 = 'data/experiments/fig_4_left/K10';
   mkdir(dir_root1);
   
   dir_root2 = 'data/experiments/fig_4_left/K50';
   mkdir(dir_root2);
   
   c0true = 1;
   
   temp = load('data/topic_matrices/params_ap_K10.mat');
   D1 = temp.D;
   [~, K1] = size(D1);
   c = temp.c;
   c1 = c0true*c/sum(c);
   
   temp = load('data/topic_matrices/params_ap_K50.mat');
   D2 = temp.D;
   [M, K2] = size(D2);
   c = temp.c;
   c2 = c0true*c/sum(c);
   
   L = 200;
   N = 20000;
   b = c0true/L;
   nruns = 5;
   
   for irun = 1:nruns

     disp(['sampling for irun = ',num2str(irun),', K = 10'])
     SX = sample_from_gp_model(K1, M, N, D1, c1, b);
     save(strcat(dir_root1,'/dataN',num2str(N),'irun',num2str(irun)),'SX')

     disp(['sampling for irun = ',num2str(irun),', K = 50'])
     SX = sample_from_gp_model(K2, M, N, D2, c2, b);
     save(strcat(dir_root2,'/dataN',num2str(N),'irun',num2str(irun)),'SX')

   end
   
end
