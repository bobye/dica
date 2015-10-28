function compute_allerrors_for_fig_2_top_right(dir_root)
  exp_name = 'fig_2_top_right';

  [c0,D1,~,K1,D2,~,K2,~,~,Ns,nruns] = get_parameters_for_fig_2_top_right;
  len = length(Ns);
  nalg = 4;
  dir_exp_1 = strcat(dir_root,'/',exp_name,'/K',num2str(K1));
  dir_exp_2 = strcat(dir_root,'/',exp_name,'/K',num2str(K2));
  
  times = cell(len,1);
  l1errors = cell(len,1);
  
  for i = 1:len
    N = Ns(i);
    dat = strcat('dataN',num2str(N));
    [l1, ~, tt] = intermediate_errors_for_fig_2(...
                       nalg,dat,dir_exp_1,dir_exp_2,c0,D1,K1,D2,K2,nruns);
    times{i} = tt;
    l1errors{i} = l1;
  end
  
  save( strcat(dir_root,'/plots/allerr_',exp_name), 'times', 'l1errors' )
  
end
