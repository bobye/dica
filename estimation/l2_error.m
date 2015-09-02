function [err2, perm] = l2_error(Dest, D)
%L1_ERROR Computes the L2-error between two topic matrices Dest and D of
%   the same size
%
% [err2, perm] = l2_error(Dest, D)
%
% Input:
%   Dest : M-by-K topic matrix estimated by an algorithm
%   D    : M-by-K ground truth topic matrix
%
% Output:
%   err2 : the estimated error scaled to the [0,1] interval
%   perm : permutation of the columns of Dest corresponding to the
%          estimated error err2 (Dest(:,perm) \approx D) when properly
%          renormalized

% Copyright 2015, Anastasia Podosinnikova

  [Dest, D, K] = verify_correctness_of_the_input_and_normalize(Dest, D);
  
  Perf = zeros(K);
  for i=1:K, 
    for j=1:K, 
      Perf(i,j) = norm(Dest(:,i)-D(:,j), 2); % l2-norm! 
    end
  end
  
  % as the columns of the topic matrix are estimated up to permutations
  [matching, cost] = HungarianBipartiteMatching(Perf);
  
  [perm, ~] = find(sparse(matching));
  err2 = cost/K;
  err2 = err2/sqrt(2);  % to scale in [0,1]
  
end

function [Dest, D, K] = verify_correctness_of_the_input_and_normalize(Dest, D)

  if (size(Dest,1) ~= size(D,1)) || (size(Dest,2) ~= size(D,2))
    error('Wrong input size')
  end

  if (sum(sum(isnan(D))) > 0) || (sum(sum(isnan(Dest))) > 0)
    error('Wrong input')
  end
  
  [~, K] = size(D);
  
  if (sum(sum(find(Dest<0))) > 0) || (sum(sum(find(D<0))) > 0)
    % check non-negativity
    error('Wrong input')
  end
  
  % normalize each column to the unit l2-norm
  for k = 1:K
    Dest(:,k) = Dest(:,k) / norm(Dest(:,k));
    D(:,k) = D(:,k) / norm(D(:,k));
  end
  
end
