function [D, alpha, K, M, final_likelihood] = lda_read_output(file_root)
  nout = nargout;
  
  % read the topic matrix
  filename = sprintf('%s/final.beta',file_root);
  logD = load(filename);
  D = exp(logD)';
  
  if nout > 1
    % read alpha, K, and M
    fid = fopen(strcat(file_root,'/final.other'));
    K = fscanf(fid,'num_topics %d\n',1);
    M = fscanf(fid,'num_terms %d\n',1);

    alpha = zeros(K,1);
    alpha(1) = fscanf(fid,'alpha %f',1);
    for k = 2:K
      alpha(k) = fscanf(fid,' %f',1);
    end

    fclose(fid);
  end
  
  if nout > 4
    % read the likelihood
    fid = fopen(strcat(file_root,'/likelihood.dat'));
    res = textscan(fid,'%f\t%f\n');
    rr = res{1};
    final_likelihood = max(rr);
  end
  
end
