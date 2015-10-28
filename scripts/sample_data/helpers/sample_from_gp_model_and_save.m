function sample_from_gp_model_and_save(dir_save,irun,K,M,N,D,c,b)
  SX = sample_with_at_least_3_tokens( ...
         @sample_from_gp_model, K, M, N, D, c, b);
  save(strcat(dir_save,'/dataN',num2str(N),'irun',num2str(irun)),'SX')
end
