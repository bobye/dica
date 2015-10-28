function compute_allerrors_for_fig_2_bottom_right(dir_root)
  exp_name = 'fig_2_bottom_right';
  nalg = 4;
  
  [c0,D1,~,K1,D2,~,K2,~,~,~,~,gams,nruns] = get_parameters_for_fig_2_bottom_rigth;
  len = length(gams);
  dir_exp_1 = strcat(dir_root,'/',exp_name,'/K',num2str(K1));
  dir_exp_2 = strcat(dir_root,'/',exp_name,'/K',num2str(K2));
  
  times = cell(len,1);
  l1errors = cell(len,1);
  
  for i = 1:len
    gam = gams(i);
    dat = strcat('data_gam',double_to_string(gam));
    [l1, ~, tt] = intermediate_errors_for_fig_2(...
                       nalg,dat,dir_exp_1,dir_exp_2,c0,D1,K1,D2,K2,nruns);
    times{i} = tt;
    l1errors{i} = l1;
  end
  
  save( strcat(dir_root,'/plots/allerr_',exp_name), 'times', 'l1errors' )
  
end
