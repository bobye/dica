function plotopts = make_default_plotopts
  plotopts.position = [0 0 1680 1050]; 
  plotopts.fontname = 'Times New Roman';
  plotopts.fontsize = 60;
  plotopts.islatex = 1;
  plotopts.istitle = 0;
  plotopts.titlestr = '';
  
  plotopts.yname = '$\ell_1$-error';
  plotopts.isylim = 1;
  plotopts.ylims = [0 1];
  plotopts.isyticks = 0;
  plotopts.yticks = 0;
  
  plotopts.linewidth = 6;
  
  plotopts.islegend = 0;
  plotopts.legendsize = 65;
  
end
