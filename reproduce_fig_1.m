%REPRODUCE_FIG_1 Script to reproduce the experiment from Fig. 1 of our
% paper. It is recommended to parallelize the double for loops in
% scripts/run_experiments/helpers/script_run_experiment_for_fig_1.m,
% otherwise it may take around a week or more to run this script. If you
% want to change a directory where the files are saved, modify dir_root.

% Copyright 2015, Anastasia Podosinnikova

str = input(strcat('Whithout parallelization, this script will run for about a week.',...
  '\n It requires 1Gb of space. Do you want to continue? (y/n)\n'),'s');
if strcmp(str,'n'), error('Terminated'), end

dir_root = 'experiments';
dir_plots = strcat(dir_root,'/plots');
if exist(dir_plots,'dir') ~= 7
  mkdir(dir_plots);
end

% sample data
tt = tic;
sample_data_for_fig_1(dir_root)
time_sample = toc(tt)

...

% run exps
tt = tic;
script_run_experiment_for_fig_1(dir_root)
time_run = toc(tt)

save(strcat(dir_root,'/times_fig_1'), 'time_sample', 'time_run')

make_figure_1_left(dir_root)
make_figure_1_right(dir_root)
