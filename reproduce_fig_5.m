%REPRODUCE_FIG_5 Script to reproduce the experiment from Fig. 5 of our
% paper. It is recommended to parallelize the double ``for'' loops in
% scripts/run_experiments/helpers/script_run_experiment_for_fig_5_*.m,
% otherwise it may take about 4 hours or more to run this script. If you
% want to change a directory where the files are saved, modify dir_root.

% Copyright 2015, Anastasia Podosinnikova

str = input(strcat('Whithout parallelization, this script will run for about 4 hours.',...
  '\n It requires 400Mb of space. Do you want to continue? (y/n)\n'),'s');
if strcmp(str,'n'), error('Terminated'), end

dir_root = 'experiments';
mkdir(strcat(dir_root,'/plots'));

% sample data
tt = tic;
sample_data_for_fig_5_left(dir_root)
sample_data_for_fig_5_right(dir_root)
time_sample = toc(tt)

...

% run exps
tt = tic;
script_run_experiment_for_fig_5_left(dir_root)
script_run_experiment_for_fig_5_right(dir_root)
time_run = toc(tt)

save(strcat(dir_root,'/times_fig_5'), 'time_sample', 'time_run')

make_figure_5_left(dir_root)
make_figure_5_right(dir_root)
