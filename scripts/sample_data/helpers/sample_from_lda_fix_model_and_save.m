function sample_from_lda_fix_model_and_save(dir_save,irun,K,M,N,L,D,c)
  SX = sample_with_at_least_3_tokens( ...
          @sample_from_lda_fix_model, K, M, N, L, D, c);
  save(strcat(dir_save,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
end
