function [SX, Thetas] = sample_from_lda_fix_2_model(K, M, N, gam, L1, L2, D, c)
%SAMPLE_FROM_LDA_FIX_2_MODEL Samples documents and respective hidden
%   variables from the LDA-fix2(gam,L1,L2) models (as defined in our paper)
%
% [SX, Thetas] = sample_from_lda_fix_2_model(K, M, N, gam, L1, L2, D, c)
%
% Input:
%   K   : number of topics
%   M   : number of words in the dictionary
%   N   : number of documents
%   gam : portion of documents with length L2 (in [0,1])
%   L1  : document length for the first part of the corpus
%   L2  : document length for the second part of the corpus
%   D   : M-by-K topic matrix
%   c   : parameter of the Dirichlet distribution
%
% Output:
%   SX     : M-by-N sparse matrix, its n-th column is the count vector of
%            the n-th document
%   Thetas : K-by-N matrix, its n-th column is the topic mixture vector
%            (theta) of the n-th document

% Copyright 2015, Anastasia Podosinnikova
  
  if gam < 0 || gam >1, error('Wrong input'), end

  N2 = round(gam*N);
  N1 = N - N2;
  disp(['N2 = ',num2str(N2),', N1 = ',num2str(N1)])
  
  [SX1, Thetas1] = sample_from_lda_fix_model(K, M, N1, L1, D, c);
  [SX2, Thetas2] = sample_from_lda_fix_model(K, M, N2, L2, D, c);
  
  SX = [SX1 SX2];
  Thetas = [Thetas1 Thetas2];
  
  rp = randperm(N);
  SX = SX(:,rp);
  Thetas = Thetas(:,rp);

end

