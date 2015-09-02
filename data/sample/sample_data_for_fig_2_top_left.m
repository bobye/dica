function sample_data_for_fig_2_top_left
%SAMPLE_DATA_FOR_FIG_2_TOP_LEFT

% Copyright 2015, Anastasia Podosinnikova

   dir_root1 = 'data/experiments/fig_2_top_left/K10';
   mkdir(dir_root1);
   
   dir_root2 = 'data/experiments/fig_2_top_left/K90';
   mkdir(dir_root2);
   
   c0 = 1;
   
   temp = load('data/topic_matrices/params_nips_K10.mat');
   D1 = temp.D;
   [~, K1] = size(D1);
   c = temp.c;
   c1 = c0*c/sum(c);
   
   temp = load('data/topic_matrices/params_nips_K90.mat');
   D2 = temp.D;
   [M, K2] = size(D2);
   c = temp.c;
   c2 = c0*c/sum(c);
   
   
   % expected document length 
   L = 1300;
   b = c0 / L;
   
   nruns = 5;
   Ns = [1000 10000:10000:50000];
   
   for N = Ns
     for irun = 1:nruns
       
       disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun),', K = 10'])
       SX = sample_from_gp_model(K1, M, N, D1, c1, b);
       save(strcat(dir_root1,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
       
       disp(['sampling for N = ',num2str(N),', irun = ',num2str(irun),', K = 90'])
       SX = sample_from_gp_model(K2, M, N, D2, c2, b);
       save(strcat(dir_root2,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
       
     end
   end

end