function SX = sample_with_at_least_3_tokens(sample_handle, varargin)
  SX = feval(sample_handle, varargin{:});
  Ls = full(sum(SX));
  inds = find(Ls < 3); len = length(inds);
  iter = 1;
  while len > 0
    sx = feval(sample_handle, varargin{:});
    sx = sx(:,logical(sum(sx) > 2));
    nn = min(len,size(sx,2));
    SX(:,inds(1:nn)) = sx(:,1:nn);
    Ls = full(sum(SX));
    inds = find(Ls < 3); len = length(inds);
    iter = iter + 1; 
    if iter > 100, error('Data with at least 3 tokens can not be sampled'), end
  end
end