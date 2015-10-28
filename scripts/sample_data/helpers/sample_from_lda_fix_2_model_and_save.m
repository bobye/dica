function sample_from_lda_fix_2_model_and_save(dir_save,irun,K,M,N,gam,L1,L2,D,c)
  SX = sample_with_at_least_3_tokens( ...
         @sample_from_lda_fix_2_model,K, M, N, gam, L1, L2, D, c);
  save(strcat(dir_save,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
end
