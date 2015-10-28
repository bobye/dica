function algopts = make_algopts_fig_2
  algopts.nalg = 4;
  algopts.algspecs = {'-','-','-','-'};
  orange = [.8 .3 0];
  grey = [.3 .3 .3];
  algopts.algcolors = {orange,grey,orange,grey};
  algopts.markers  = {'o','d','o','d'};
  lorange = [.9 .5 0];
  lgrey = [.5 .5 .5]; 
  algopts.markcols = {lorange,lgrey,'w','w'};
  algopts.marksizes = {30, 30, 30, 30};
  algopts.algnames = {'JD-GP(10)','JD-LDA(10)','JD-GP(90)','JD-LDA(90)'};
end
