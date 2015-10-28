function [Dest, A, as, W] = jd_full_basis(SX, K, momtype, opts, c0)
%JD_FULL_BASIS Joint diagonalization for topic models with projections onto
%   the full basis of R^M (for test and debug purposes only)
%
% [A, diags, W] = jd_full_basis(SX, K, momtype, isrand, c0)
%
% Input:
%   SX      : sparse M-by-N matrix of word counts X with docs in columns
%   K       : number of topics
%   momtype : either 'lda' for LDA moments or 'dica' for DICA cumulants
%   opts    : either 0 (for defaults) 
%             
%             or struct with the following fields:
%             * 'isrand' is the initialization type for the algorithm
%               - if set to 0, it is initialized with the K-identity matrix
%                 (default)
%               - if set to 1, it is initialized with a random K-by-K
%                 orthogonal matrix
%             * 'nruns' is the number of repetitions if isrand = 1; has to
%                 greater or equal to 1; the algorithm with random
%                 initialization is run 'nruns' times and the output with 
%                 the best (smallest) objective is reported
%   isrand  : initialization type for the joint diagonalization
%             - if set to 0, initialized with the identity matrix
%             - if set to 1, inialized with a random orthogonal matrix
%   c0      : parameter for LDA moments (only if momtype = 'lda')
%
% Output:
%   Dest : estimation of the parameter D (topic matrix)
%   A    : K-by-M diagonalizing matrix
%   as   : cell array with almost diagonal matrices A*S*A', A*T(v_p)*A'
%   W    : K-by-M whitening matrix
%   
% Comment 1: See "estimate_D.m" for details on estimation of D.
%
% Comment 2: See "jd.m" for some relevant details (type "help jd").

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
  
  % perform joint diagonalization (this part is the sampe as for jd.m)
  if opts.isrand == 0
    [V, as] = joint_diagonalization([eye(K) WTWs], opts.isrand); % (!) eye(K) = W*S*W'
  end
  if opts.isrand == 1
    Vs = cell(opts.nruns,1);
    Ds = cell(opts.nruns,1);
    objs = zeros(opts.nruns,1);
    for irun = 1:opts.nruns
      [V, as] = joint_diagonalization([eye(K) WTWs], opts.isrand); % (!) eye(K) = W*S*W'
      obj = compute_jd_objective([eye(K) WTWs], V);
      Vs{irun} = V; Ds{irun} = as; objs(irun) = obj;
    end
    [~,ind] = min(objs);
    V = Vs{ind};
    as = Ds{ind};
  end
  A = V'*W;
  
  
  
  % Estimation of the parameters (D, c)
  
  M = size(A,2);
  % problem: the pseudo inverse can introduce negative values
  Dest = pinv(A);
  % each column of Dest is estimated up to multiplication by scalar
  % => checking wheter columns have correct signs
  [Dest, signs] = flip_column_signs(Dest);
  % truncate all negative values
  Dest = max(0,Dest);
  
  % normalize each column of Dest to be in the simplex
  Dest = Dest./repmat(sum(Dest),M,1);
  
end
