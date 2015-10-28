function make_latex_for_plots(dir_root)

  fid = fopen(strcat(dir_root,'/plots/plots.tex'),'w');

  fprintf(fid,'\\documentclass{article}\n');
  fprintf(fid,'\\usepackage{graphicx}\n');
  fprintf(fid,'\\usepackage{caption}\n\n');

  fprintf(fid,'\\oddsidemargin .25in\n');
  fprintf(fid,'\\evensidemargin .25in\n');
  fprintf(fid,'\\marginparwidth 0.07 true in\n');
  fprintf(fid,'\\topmargin -1in\n');
  fprintf(fid,'\\textheight 10.25 true in\n');
  fprintf(fid,'\\textwidth 6.25 true in\n\n');

  fprintf(fid,'\\begin{document}\n\n');

  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{tabular}{ccc}\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_1_left_l1.eps}\n');
  fprintf(fid,'&\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_1_right_l1.eps}\n');
  fprintf(fid,'\\end{tabular}\n');
  fprintf(fid,'\\caption{\n');
  fprintf(fid,'... Fig. 1\n');
  fprintf(fid,'}');
  fprintf(fid,'\\end{figure}\n\n');

  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{tabular}{ccc}\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_2_top_left_l1.eps}\n');
  fprintf(fid,'&\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_2_top_right_l1.eps}\n');
  fprintf(fid,'\\\\\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_2_bottom_left_l1.eps}\n');
  fprintf(fid,'&\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_2_bottom_right_l1.eps}\n');
  fprintf(fid,'\\end{tabular}\n');
  fprintf(fid,'\\caption{\n');
  fprintf(fid,'... Fig. 2\n');
  fprintf(fid,'}\n');
  fprintf(fid,'\\end{figure}\n\n');

  
  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{center}\n');
  fprintf(fid,'\\begin{tabular}{cccc}\n');
  fprintf(fid,'\\includegraphics[width=.36\\columnwidth]{ap_eval.eps}\n');
  fprintf(fid,' &\n'); 
  fprintf(fid,'\\includegraphics[width=.14\\columnwidth]{real_legend.eps}\n');
  fprintf(fid,' &\n');
  fprintf(fid,'\\includegraphics[width=.36\\columnwidth]{kos_eval.eps} \n');
  fprintf(fid,'\\end{tabular}\n');
  fprintf(fid,'\\caption{ \n');
  fprintf(fid,'... Fig. 3 \n');
  fprintf(fid,'}\n');
  fprintf(fid,'\\end{center}\n');
  fprintf(fid,'\\end{figure}\n\n');

  
  
  
  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{tabular}{cc}\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_5_left_l1.eps}\n');
  fprintf(fid,'&\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_5_right_l1.eps}\n');
  fprintf(fid,'\\end{tabular}');
  fprintf(fid,'\\caption{\n');
  fprintf(fid,'... Fig. 5\n');
  fprintf(fid,'}\n');
  fprintf(fid,'\\end{figure}\n\n');

  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{tabular}{cc}\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_6_left.eps}\n');
  fprintf(fid,'&\n');
  fprintf(fid,'\\includegraphics[width=.46\\columnwidth]{fig_6_right.eps}\n');
  fprintf(fid,'\\end{tabular}\n');
  fprintf(fid,'\\caption{\n');
  fprintf(fid,'... Fig. 6\n');
  fprintf(fid,'}\n');
  fprintf(fid,'\\end{figure}\n\n');

  fprintf(fid,'\\begin{figure}[t]\n');
  fprintf(fid,'\\begin{center}\n');
  fprintf(fid,'\\begin{tabular}{cccc}\n');
  fprintf(fid,'\\includegraphics[width=.36\\columnwidth]{ap_eval.eps}\n');
  fprintf(fid,' &\n'); 
  fprintf(fid,'\\includegraphics[width=.14\\columnwidth]{real_legend.eps}\n');
  fprintf(fid,' &\n');
  fprintf(fid,'\\includegraphics[width=.36\\columnwidth]{nips_eval.eps} \n');
  fprintf(fid,'\\end{tabular}\n');
  fprintf(fid,'\\caption{ \n');
  fprintf(fid,'... Fig. 7 \n');
  fprintf(fid,'}\n');
  fprintf(fid,'\\end{center}\n');
  fprintf(fid,'\\end{figure}\n\n');

  fprintf(fid,'\\end{document}\n\n');

  fclose(fid);
  
end
