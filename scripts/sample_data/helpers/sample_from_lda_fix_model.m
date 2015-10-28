function [SX, Thetas] = sample_from_lda_fix_model(K, M, N, L, D, c)
%SAMPLE_FROM_LDA_FIX_MODEL Samples documents and respective hidden
%   variables from the LDA model with the fixed to L document length
%
% [SX, Thetas] = sample_from_lda_fix_model(K, M, N, L, D, c)
%
% Input:
%   K : number of topics
%   M : number of words in the dictionary
%   N : number of documents
%   L : length of each document in the corpus
%   D : M-by-K topic matrix
%   c : parameter of the Dirichlet distribution
%
% Output:
%   SX     : M-by-N sparse matrix, its n-th column is the count vector of
%            the n-th document
%   Thetas : K-by-N matrix, its n-th column is the topic mixture vector
%            (theta) of the n-th document

% Copyright 2015, Anastasia Podosinnikova
  
  if size(D,1) ~= M || size(D,2) ~= K, error('Wrong input'), end

  Thetas = zeros(K, N);
  SX = sparse(M, N);
  if isrow(c), c = c'; end
  
  % sample in batches
  n = 1000;
  times = floor(N/n);
  rest = mod(N,n);
  
  for i=1:times
    inds = (i-1)*n+1:i*n;
    [thetas, sx] = sample_batch(c,L,n,K,D);
    Thetas(:,inds) = thetas;
    SX(:,inds) = sx;
  end
  
  inds = times*n + 1 : times*n + rest;
  [thetas, sx] = sample_batch(c,L,rest,K,D);
  Thetas(:,inds) = thetas;
  SX(:,inds) = sx;
    
end

function [theta,sx] = sample_batch(c,L,n,K,D)
  b = 1;
  Ls = L*ones(1,n);
  alphs = gamrnd(repmat(c,1,n),repmat(1/b,K,n));
  r = sum(alphs);
  r(logical(r==0)) = 1;
  theta = alphs ./ repmat(r,K,1);
  
  params = (D*theta)';
  % to avoid numerical problems, renormalize again
  params = params ./ repmat(sum(params,2), 1, size(D,1));
  sx = sparse(mnrnd(Ls',params,n)');
  if sum(sum(isnan(sx))) > 0, error('Something is wrong'), end
end
