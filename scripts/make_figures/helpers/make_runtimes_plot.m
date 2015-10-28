function make_runtimes_plot(dir_root, exp_name, plotopts, xxs, algopts)
  % plot for runtimes
  load( strcat(dir_root, '/plots/allerr_',exp_name), 'times' )
  plotopts.islegend = 0;
  plotopts.yname = 'Runtime in log(sec)';
  plotopts.isylim = 0;
  plotopts.plotname2save = [dir_root,'/plots/',exp_name,'_times'];
  log_times = cell(size(times));
  for i = 1:length(times)
    log_times{i} = log(times{i});
  end
  make_single_plot(xxs, log_times, algopts, plotopts)
end
