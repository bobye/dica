function Dest = estimate_D(A)
%ESTIMATE_D Estimates topic matrix from the output of spectral, jd, or tpm
%
% Dest = estimate_D(A);
%
% Input:
%   A : output of spectral, jd, or tpm
%
% Output:
%   Dest : estimate of the topic matrix
%
% Comment: Just taking the pseudo-inverse of A is not sufficient because it
%   can (and in practice does) introduce negative values. This is due to
%   the noise present in the data. Indeed, if the data is infinite and comes
%   from the correct model (LDA or DICA) then no negative values occur. 
%   In practice, however, one has to deal with the noise due to finite 
%   samples and deviations from the correct model. Therefore, some
%   heuristic post-processing to eliminate negative values is required.

% Copyright 2015, Anastasia Podosinnikova

  M = size(A,2);
  C = pinv(A); % pseudo-inverse can introduce undesirable negative values
  C = flip_columns_signs_square_rule(C); % decide the signs of each column
  C = max(0,C); % truncate negative values
  Dest = C./repmat(sum(C),M,1); % normalize to have each column sum to 1
end

function [C, signs] = flip_columns_signs_square_rule(C)
  K = size(C,2);
  signs = ones(1,K);
  for k = 1:K
    val1 = sum(min(0,C(:,k)).^2);
    val2 = sum(max(0,C(:,k)).^2);
    signs(k) = sign(val2 - val1);
  end
  C = C*diag(signs);
end
