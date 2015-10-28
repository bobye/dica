function make_figure_2_top_left(dir_root)
  exp_name = 'fig_2_top_left';

  [~,~,~,~,~,~,~,~,~,Ns,~,~] = get_parameters_for_fig_2_top_left;
  xs = Ns;
  len_x = length(xs);
  
  % make lines/algorithms options
  algopts = make_algopts_fig_2;
  nalg = algopts.nalg;

  % make plot options
  plotopts = make_default_plotopts;
  
  xs = xs/1000;
  plotopts.xname = 'Number of docs in 1000s';
  plotopts.isxlim = 1;
  plotopts.xlims = [xs(1)-1 xs(end)+1];
  plotopts.isxticks = 1;
  plotopts.xticks = xs;
  
  % plot for the l1error
  load( strcat(dir_root, '/plots/allerr_', exp_name), 'l1errors' )
  plotopts.plotname2save = [dir_root,'/plots/',exp_name,'_l1'];
  [ys, ys_L, ys_U] = convert_to_errorbar_format(l1errors,len_x,nalg);
  make_single_plot(xs, ys, ys_L, ys_U, algopts, plotopts)

end
