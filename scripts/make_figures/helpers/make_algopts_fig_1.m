function algopts = make_algopts_fig_1
  algopts.nalg = 5;
  algopts.algspecs = {'--', '--', '--', ':', ':'};
  
  blue = [0 .2  .6];
  grey = [.3 .3 .3];
  lgrey = [.5 .5 .5]; 
  orange = [.8 .3 0];
  lorange = [.9  .5 0];
  green =  [.1 .4 .1];
  lgreen = [.2 .5 .2];
  algopts.algcolors = {orange, grey, blue, orange, green};
  algopts.markers = {'o', '^', 'v', '*', 'd'};
  algopts.markcols = {lorange, lgrey, 'w', 'w', lgreen};
  algopts.marksizes = {30, 30, 30, 30, 30};
  algopts.algnames = {'JD', 'JD(k)', 'JD(f)', 'Spec', 'TPM'};  
end
