%SHOW_PLOTS_FROM_THE_PAPER Reproduces the plots reported in the paper,
% produces .tex file with the figures, compiles the .tex file, and opens it
% in the Adobe Reader. Assumes that LaTeX and Adobe Reader are installed.

% Copyright 2015, Anastasia Podosinnikova

dir_root = 'experiments/precomputed';

make_figure_1_left(dir_root)
make_figure_1_right(dir_root)
make_figure_2_bottom_left(dir_root)
make_figure_2_bottom_right(dir_root)
make_figure_2_top_left(dir_root)
make_figure_2_top_right(dir_root)
make_figure_5_left(dir_root)
make_figure_5_right(dir_root)
make_figure_6(dir_root)

make_figure_for_real_data(dir_root, 'kos')
make_figure_for_real_data(dir_root, 'ap')
make_figure_for_real_data(dir_root, 'nips')

make_latex_for_plots(dir_root)

cd ( strcat(dir_root,'/plots/') )
system( './plotspdf.sh' )
cd ../../..

open( strcat(dir_root,'/plots/plots.pdf') )
