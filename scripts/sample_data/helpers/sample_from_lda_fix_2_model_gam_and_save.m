function sample_from_lda_fix_2_model_gam_and_save(dir_save,irun,K,M,N,gam,L1,L2,D,c)
  SX = sample_with_at_least_3_tokens( ...
         @sample_from_lda_fix_2_model,K, M, N, gam, L1, L2, D, c);
  dataname = strcat('data_gam',double_to_string(gam),'irun',num2str(irun));
  save(strcat(dir_save,'/',dataname),'SX')
end
