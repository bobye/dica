function make_figure_5_left(dir_root)
  exp_name = 'fig_5_left';

  c0s = [0.01 0.1 1 10 100];
  
  % make lines/algorithms options
  algopts = make_algopts_fig_2;
  nalg = algopts.nalg;
  
  % make plot options
  plotopts = make_default_plotopts;
  
  xs = 1:5;
  len_x = length(xs);
  plotopts.xname = 'Parameter $c_0$';
  plotopts.isxlim = 1;
  plotopts.xlims = [xs(1)-0.1 length(xs)+0.1];
  plotopts.isxticks = 1;
  plotopts.xticks = c0s;
  
  % plot for the l1error
  load( strcat(dir_root, '/plots/allerr_', exp_name), 'l1errors' )
  plotopts.plotname2save = [dir_root,'/plots/',exp_name,'_l1'];
  [ys, ys_L, ys_U] = convert_to_errorbar_format(l1errors,len_x,nalg);
  make_single_plot(xs, ys, ys_L, ys_U, algopts, plotopts)

end
