function make_figure_2_bottom_right(dir_root)
  exp_name = 'fig_2_bottom_right';
  
  [~,~,~,~,~,~,~,~,~,~,~,gams,~] = get_parameters_for_fig_2_bottom_rigth;
  xs = gams;
  len_x = length(xs);
  
  % make lines/algorithms options
  algopts = make_algopts_fig_2;
  nalg = algopts.nalg;

  % make plot options
  plotopts = make_default_plotopts;
  
  plotopts.xname = 'Fraction of doc lengths $\gamma$';
  plotopts.isxlim = 1;
  plotopts.xlims = [xs(1)-0.01 xs(end)+0.01];
  plotopts.isxticks = 0;
  plotopts.xticks = xs;
  
  % plot for the l1error
  load( strcat(dir_root, '/plots/allerr_', exp_name), 'l1errors' )
  plotopts.plotname2save = [dir_root,'/plots/',exp_name,'_l1'];
  [ys, ys_L, ys_U] = convert_to_errorbar_format(l1errors,len_x,nalg);
  make_single_plot(xs, ys, ys_L, ys_U, algopts, plotopts)

end
