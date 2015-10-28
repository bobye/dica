function opts = set_jd_full_opts(opts_exp)

  if ~isfield(opts_exp,'jd_isrand'), error('Wrong opts_exp.isrand'), end
  opts.isrand = opts_exp.jd_isrand;
  if ~( opts.isrand == 0 || opts.isrand == 1 )
    error('Wrong opts.irand')
  end
  
  if opts.isrand == 1
    if ~isfield(opts_exp,'jd_nruns'), error('Wrong opts_exp.jd_nruns'), end
    opts.nruns = opts_exp.jd_nruns;
  end
  
  if isfield(opts_exp,'c0')
    opts.c0 = opts_exp.c0;
  end
  
end
