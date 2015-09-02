function sample_data_for_fig_2_bottom_right
%SAMPLE_DATA_FOR_FIG_2_BOTTOM_RIGHT

% Copyright 2015, Anastasia Podosinnikova
  
   dir_root1 = 'data/experiments/fig_2_bottom_right/K10';
   mkdir(dir_root1);
   
   dir_root2 = 'data/experiments/fig_2_bottom_right/K90';
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
   
   L1 = 20; L2 = 200;
   
   N = 20000;
   
   gams = 0:0.1:1;
   nruns = 5;
   
   for gam = gams
     for irun = 1:nruns
       
       disp(['sampling for gam = ',num2str(gam),', irun = ',num2str(irun),', K = 10'])
       SX = sample_from_lda_fix_2_model(K1, M, N, gam, L1, L2, D1, c1);
       save(strcat(dir_root1,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
       
       disp(['sampling for gam = ',num2str(gam),', irun = ',num2str(irun),', K = 90'])
       SX = sample_from_lda_fix_2_model(K1, M, N, gam, L1, L2, D1, c1);
       save(strcat(dir_root2,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
       
     end
   end
   
end
