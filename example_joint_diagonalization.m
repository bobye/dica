% This script illustrates usage of the joint_diagonalization.m

% Copyright 2015, Anastasia Podosinnikova


% sample toy data (commuting matrices for simplicity)
m = 3; n = 4;
V = sample_orthogonal_matrix(m);
B = zeros(m,m*n);
true_diags = cell(1,n);
for i = 1:n
  true_diags{i} = diag(0.1 + rand(1,m));
  B(:,(i-1)*m+1:i*m) = V*true_diags{i}*V';
end


% run the joint diagonalization algorithm
[U, diags] = joint_diagonalization(B);

disp('U is V up to the columns sign changes & permutations:')
V,U


% B is m-by-(m*n) matrix of n m-by-m matrices B_1, B_2, ..., B_n
% diags{i} is the diagonal matrix U'*B_i*U
disp('diags are respective diagonal matrices, e.g.:')
true_diags{1}, diags{1}

% it also works for non-commuting matrices
