function make_lda_c_data_file(X,filename)
  [M N] = size(X);
  
  fid = fopen(filename,'w');
  
  
  for n=1:N
    len = nnz(X(:,n));
    fprintf(fid,'%d',len);
    inds = find(X(:,n)>0);
    for i=1:len
      fprintf(fid,' %d:%d',inds(i)-1,X(inds(i),n));
    end
    fprintf(fid,'\n');
  end
  
  
  fclose(fid);
end

