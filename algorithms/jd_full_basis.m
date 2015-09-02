function [A, diags, W] = jd_full_basis(SX, K, momtype, isrand, c0)
%JD_FULL_BASIS Joint diagonalization for topic models with projections onto
%   the full basis of R^M (for test and debug purposes only)
%
% [A, diags, W] = jd_full_basis(SX, K, momtype, isrand, c0)
%
% Input:
%   SX      : sparse M-by-N matrix of word counts X with docs in columns
%   K       : number of topics
%   momtype : either 'lda' for LDA moments or 'dica' for DICA cumulants
%   isrand  : initialization type for the joint diagonalization
%             - if set to 0, initialized with the identity matrix
%             - if set to 1, inialized with a random orthogonal matrix
%   c0      : parameter for LDA moments (only if momtype = 'lda')
%
% Output:
%   A     : K-by-M diagonalizing matrix
%   diags : cell array with almost diagonal matrices A*S*A', A*T(v_p)*A'
%   W     : K-by-M whitening matrix
%   
% Comment 1: See "estimate_D.m" for estimation of the topic matrix.
%
% Comment 2: The function "jd.m" contains relevant comments (type "help jd").

% Copyright 2015, Anastasia Podosinnikova

  if ~( strcmp(momtype,'dica') || strcmp(momtype,'lda')), 
    error('Wrong momtype')
  end

  % compute whitening matrix and WTWs
  if strcmp(momtype,'dica') 
    [W, M1] = compute_S_and_W_dica(SX, K); 
    WTWs = compute_wtw_for_M_canonical_basis_dica(SX, W, K, M1);
  end
  if strcmp(momtype,'lda')
    [W, M1, M2] = compute_S_and_W_lda(SX, K, c0);
    WTWs = compute_wtw_for_M_canonical_basis_lda(SX, W, K, M1, M2, c0);
  end
  
  % perform joint diagonalization
  [V, diags] = joint_diagonalization([eye(K) WTWs], isrand); % (!) eye(K) = W*S*W'
  A = V'*W;
  
end
