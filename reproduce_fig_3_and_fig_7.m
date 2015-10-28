%REPRODUCE_FIG_3_AND_FIG_7 Script to reproduce the real data expereiments
% of our paper. It is recommended to parallelize the double for loops in
% scripts/run_experiments/helpers/script_run_experiment_and_evaluation_for_real_data.m,
% otherwise it will infeasible time (a few months) to run this script in a
% single thread. 

% Copyright 2015, Anastasia Podosinnikova

str = input(strcat('In a single thread this script will take infeasble time.',...
  '\n Are you sure you want to continue? (y/n)\n'),'s');
if strcmp(str,'n'), error('Terminated'), end

dir_root = 'experiments';
mkdir(strcat(dir_root,'/plots'));

% run exps
script_run_experiment_and_evaluation_for_real_data(dir_root, 'kos')
script_run_experiment_and_evaluation_for_real_data(dir_root, 'ap')
script_run_experiment_and_evaluation_for_real_data(dir_root, 'nips')

make_figure_for_real_data(dir_root, 'kos')
make_figure_for_real_data(dir_root, 'ap')
make_figure_for_real_data(dir_root, 'nips')
