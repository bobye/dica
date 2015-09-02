% Samples the semi-toy data for the experiments from our paper.

% Copyright 2015, Anastasia Podosinnikova

str = input('This script requires 3.6Gb of space. Do you want to continue? (y/n)\n','s');
if strcmp(str,'n'), error('Terminated'), end

disp('It will take few hours ...')

sample_data_for_fig_1
sample_data_for_fig_2_bottom_left
sample_data_for_fig_2_bottom_right
sample_data_for_fig_2_top_left
sample_data_for_fig_2_top_right
sample_data_for_fig_4_left
sample_data_for_fig_4_right

disp('Data are sampled successfully to the folder "data/experiments/"')

