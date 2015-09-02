function [A, lams, W] = spectral(SX, K, momtype, c0)
%SPECTRAL Spectral algorithm for topic modeling
%
% [A, lams, W] = spectral(SX, K, momtype, c0)
%
% Input:
%   SX      : sparse M-by-N matrix of word counts X with docs in columns
%   K       : number of topics
%   momtype : either 'lda' for LDA-moments or 'dica' for DICA-cumulants
%   c0      : parameter (only for LDA-moments, i.e. momtype = 'lda')
%
% Output:
%   A      : K-by-M diagonalizing matrix
%   lams   : K-vector with the eigenvalues
%   W      : K-by-M whitening matrix
%
% Comment: See "estimate_D.m" for estimation of the topic matrix.

% Copyright 2015, Anastasia Podosinnikova


  if ~( strcmp(momtype,'dica') || strcmp(momtype,'lda') )
    error('Wrong momtype')
  end
  
  % compute whitening
  if strcmp(momtype,'dica')
    [W, M1] = compute_S_and_W_dica(SX, K);
  end
  if strcmp(momtype,'lda')
    [W, M1, M2] = compute_S_and_W_lda(SX, K, c0);
  end
  
  u = rand(K,1); u = u/norm(u);
  vecs{1} = W'*u;
  
  if strcmp(momtype,'dica')
    WTW = compute_multiple_wtw_dica(SX, W, K, vecs, M1);
  end
  if strcmp(momtype,'lda')
    WTW = compute_multiple_wtw_lda(SX, W, K, vecs, M1, M2, c0);
  end
  
  [evecs,evals] = eig(WTW);
  thetas = evecs;
  lams = diag(evals);
  A = thetas'*W;
  
end
