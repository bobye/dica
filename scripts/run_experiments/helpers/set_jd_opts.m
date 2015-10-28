function opts = set_jd_opts(opts_exp)

  if ~isfield(opts_exp,'jd_type'), error('Wrong opts_exp.jd_type'), end
  opts.type = opts_exp.jd_type;
  if ~( strcmp(opts.type,'default') || strcmp(opts.type,'random') )
    error('Wrong opts.type')
  end
  
  if strcmp(opts.type,'random')
    if ~isfield(opts_exp,'jd_P'), error('Wrong opts_exp.jd_P'), end
    opts.P = opts_exp.jd_P;
  end
  
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
