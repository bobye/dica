function V = sample_orthogonal_matrix(m)
%SAMPLE_ORTHOGONAL_MATRIX Samples orthogonal m-by-m matrix V
%
% V = sample_orthogonal_matrix(m)

% Copyright 2015, Anastasia Podosinnikova

  X = rand(m); V = orth(X);
  
end