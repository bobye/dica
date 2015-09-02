function [A, diags, W, vecs] = jd(SX, K, momtype, opts, c0)
%JD Joint diagonalization for topic models
%
% [A, diags, W, vecs] = jd(SX, K, momtype, opts, c0)
%
% Input:
%   SX      : sparse M-by-N matrix of word counts X with docs in columns
%   K       : number of topics
%   momtype : either 'lda' for LDA moments or 'dica' for DICA cumulants
%   opts    : either 0 (for defaults) 
%             
%             or struct with the following fields:
%             * 'type' defines the way projection vectors are generated;
%               - if set to 'default', K projection vectors W'*e_1, W'*e_2,
%                 ..., W'*e_P are sampled where e_1, e_2, ..., e_P is the
%                 canonical basis of R^K (the columns of the K-identity
%                 matrix) (default)
%               - if set to 'random' then another filed opts.P have to be
%                 given where P is the number of the projection vectors and
%                 each of them is sampled as W'*u where u is a vector 
%                 sampled uniformly at random from the unit K-sphere
%             * 'P' is the number of projection vectors in case 
%               opts.type = 'random'
%             * 'isrand' is the initialization type for the joint
%               diagonalization
%               - if set to 0, it is initialized with the K-identity matrix
%                 (default)
%               - if set to 1, it is initialized with a random K-by-K
%                 orthogonal matrix
%
%   c0      : parameter for LDA moments (only if momtype = 'lda')
%
% Output:
%   A     : K-by-M diagonalizing matrix
%   diags : cell array with almost diagonal matrices A*S*A', A*T(v_p)*A'
%   W     : K-by-M whitening matrix
%   vecs  : the vectors, which were used for the projections
%   
% Comment 1: See "estimate_D.m" for estimation of the topic matrix.
%
% Comment 2: Computing M projections of the LDA T-moment or the
%   DICA T-cumulant is not necessary in practice although it would explain
%   all the  data contained in the tensor T. In practice, the joint
%   diagonalization algorithm achieves comparable (with the version based
%   on M projections) results when run only, e.g., on K K-by-K matrices 
%   W*T(W'*e_1)*W', W*T(W'*e_2)*W', ..., W*T(W'*e_K)*W' with e_1, e_2, ...,
%   e_K being the canonical basis of R^K. For the version whith M 
%   projections computed, check the "jd_full_basis.m" implementation.

% Copyright 2015, Anastasia Podosinnikova


  opts = verify_correctness_of_the_input_and_set_defaults(momtype,opts);

  % compute a whitening matrix
  if strcmp(momtype,'dica')
    [W, M1] = compute_S_and_W_dica(SX, K); 
  end
  if strcmp(momtype,'lda')
    [W, M1, M2] = compute_S_and_W_lda(SX, K, c0); 
  end
  
  % construction of projection vectors is whitening matrix dependent
  if strcmp(opts.type,'default')
    E = eye(K);
    vecs = cell(K,1);
    for k = 1:K, vecs{k} = W'*E(:,k); end
  end
  if strcmp(opts.type,'random')
    P = opts.P;
    vecs = cell(P,1);
    for k = 1:P, u = rand(K,1); vecs{k} = W'*(u/norm(u)); end
  end
  
  % compute W*T(v)*W's
  if strcmp(momtype,'dica')
    WTWs = compute_multiple_wtw_dica(SX, W, K, vecs, M1);
  end
  if strcmp(momtype,'lda')
    WTWs = compute_multiple_wtw_lda(SX, W, K, vecs, M1, M2, c0);
  end
  
  % perform joint diagonalization
  [V, diags] = joint_diagonalization([eye(K) WTWs], opts.isrand); % (!) eye(K) = W*S*W'
  A = V'*W;
  
end



function opts = verify_correctness_of_the_input_and_set_defaults(momtype,opts)

  if ~( strcmp(momtype,'dica') || strcmp(momtype,'lda') )
    error('Wrong momtype')
  end
  
  if ~isstruct(opts), 
    opts = struct();
  end
  
  if ~isfield(opts,'type')
    opts(1).type = 'default';
  end
  
  if strcmp(opts.type,'random')
    if ~isfield(opts,'P')
      error('for type random, specify the number of projection vectors P')
    end
  end
  
  if ~( strcmp(opts.type,'default') || strcmp(opts.type,'random') )
    error('Wrong opts.type')
  end
  
  if ~isfield(opts,'isrand')
    opts(1).isrand = 0;
  end
  
  if ~( opts.isrand == 1 || opts.isrand == 0 )
    error('Wrong opts.isrand')
  end

end

