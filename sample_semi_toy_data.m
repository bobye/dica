%SAMPLE_SEMI_TOY_DATA Samples the semi-toy data for the experiments from 
%our paper.

% Copyright 2015, Anastasia Podosinnikova

str = input('This script requires 3.6Gb of space. Do you want to continue? (y/n)\n','s');
if strcmp(str,'n'), error('Terminated'), end

disp('It will take around 4 hours ...')

tic

dir_root = 'experiments';

sample_data_for_fig_1(dir_root)
sample_data_for_fig_2_bottom_left(dir_root)
sample_data_for_fig_2_bottom_right(dir_root)
sample_data_for_fig_2_top_left(dir_root)
sample_data_for_fig_2_top_right(dir_root)
sample_data_for_fig_5_left(dir_root)
sample_data_for_fig_5_right(dir_root)

disp(['Data are sampled successfully to the folder "',dir_root,'"'])

time = toc;

disp(['Sampling took ',num2str(time/3600),' hours'])
