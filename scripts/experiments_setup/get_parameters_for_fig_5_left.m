function [c0,D1,c1,K1,D2,c2,K2,L,M,N,b,nruns] = get_parameters_for_fig_5_left
%GET_PARAMETERS_FOR_FIG_5_LEFT Returns the parameters for the semi toy
% data from Figure 5 (rigth) of our paper.
%
% [c0,D1,c1,K1,D2,c2,K2,L,M,N,b,nruns] = get_parameters_for_fig_5_left
%
% Output:
%   c0    : true value of the parameter c_0
%   D1    : topic matrix for K = 10
%   c1    : parameter c for K = 10
%   K1    : number of topics (K1 = 10)
%   D2    : topic matrix for K = 50
%   c2    : parameter c for K = 50
%   K2    : number of topics (K2 = 50)
%   L     : expected document length for the GP model
%   M     : vocabulary size
%   N     : number of documents
%   b     : parameter b
%   nruns : number of times each data are resampled

% Copyright 2015, Anastasia Podosinnikova

  c0 = 1;

  temp = load('data/topic_matrices/params_ap_K10.mat');
  D1 = temp.D;
  [~, K1] = size(D1);
  c = temp.c;
  c1 = c0*c/sum(c);

  temp = load('data/topic_matrices/params_ap_K50.mat');
  D2 = temp.D;
  [M, K2] = size(D2);
  c = temp.c;
  c2 = c0*c/sum(c);

  L = 200;
  N = 20000;
  b = c0/L;
  nruns = 5;

end
