%REPRODUCE_FIG_2_AND_FIG_6 Script to reproduce the experiment from Fig. 2 
% of our paper. It is recommended to parallelize the double for loops in 
% scripts/run_experiments/helpers/script_run_experiment_for_fig_2_*.m,
% otherwise it may take about 35 hours or more to run this script. If you
% want to change a directory where the files are saved, modify dir_root.

% Copyright 2015, Anastasia Podosinnikova

str = input(strcat('Whithout parallelization, this script will run for about 35 hours.',...
  '\n It requires 3.5Gb of space. Do you want to continue? (y/n)\n'),'s');
if strcmp(str,'n'), error('Terminated'), end

dir_root = 'experiments';
mkdir(strcat(dir_root,'/plots'));

% sample data
tt = tic;
sample_data_for_fig_2_bottom_left(dir_root)
sample_data_for_fig_2_bottom_right(dir_root)
sample_data_for_fig_2_top_left(dir_root)
sample_data_for_fig_2_top_right(dir_root)
time_sample = toc(tt)

...

% run exps
tt = tic;
script_run_experiment_for_fig_2_bottom_left(dir_root)
script_run_experiment_for_fig_2_bottom_right(dir_root)
script_run_experiment_for_fig_2_top_left(dir_root)
script_run_experiment_for_fig_2_top_right(dir_root)
time_run = toc(tt)

save(strcat(dir_root,'/times_fig_2'), 'time_sample', 'time_run')

make_figure_2_bottom_left(dir_root)
make_figure_2_bottom_right(dir_root)
make_figure_2_top_left(dir_root)
make_figure_2_top_left(dir_root)
make_figure_6(dir_root)
