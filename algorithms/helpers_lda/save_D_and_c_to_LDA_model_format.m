function save_D_and_c_to_LDA_model_format(root_dir,file_name,D,c)

  [M K] = size(D);
  fid = fopen(strcat(root_dir,'/',file_name,'.beta'),'w');
  for k = 1:K
    for m = 1:M
      dmk = D(m,k);
      val = -100;
      if (dmk>1e-44), val = log(dmk); end
      fprintf(fid,' %5.10f', val);
    end
    fprintf(fid,'\n');
  end
  fclose(fid);
  
  fid = fopen(strcat(root_dir,'/',file_name,'.other'),'w');
  fprintf(fid,'num_topics %d\n',K);
  fprintf(fid,'num_terms %d\n',M);
  fprintf(fid,'alpha ');
  for k = 1:K
    fprintf(fid,' %5.10f',c(k));
  end
  fclose(fid);
  

end
