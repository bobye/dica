function [c0,D,c,K,L,M,Ns,b,nruns] = get_parameters_for_fig_1
%GET_PARAMETERS_FOR_FIG_1 Returns the parameters for the semi toy
% data from Figure 1 of our paper.
%
% [c0,D,c,K,L,M,Ns,b,nruns] = get_parameters_for_fig_1
%
% Output:
%   c0    : true value of the parameter c_0
%   D     : topic matrix
%   c     : parameter c
%   K     : number of topics
%   L     : expected document length for the GP model
%   M     : vocabulary size
%   Ns    : number of documents
%   b     : parameter b
%   nruns : number of times each data are resampled

% Copyright 2015, Anastasia Podosinnikova

  c0 = 0.5;

  temp = load('data/topic_matrices/params_ap_K50.mat');
  D = temp.D;
  [M, K] = size(D);
  c = temp.c;
  c = c0 * (c/sum(c));

  L = 200;
  b = sum(c) / L;
  nruns = 5;
  Ns = [1000 10000:10000:50000];

end
