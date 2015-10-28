function [D, c, time, obj, times] = vi_lda(...
          dir_data,dir_exp,dir_files,dataname,K,nruns,startoption,is_estimate_alpha)
%VI_LDA Auxilliary function to launch variational inference lda. Note that
% lda-c-modif library has to be installed first.

% Copyright 2015, Anastasia Podosinnikova
  
  if nargin < 3, error('Wrong number of inputs'), end
  if nargin < 6, is_estimate_alpha = 1; end
  if nargin < 5, startoption = 'seeded'; end
  if nargin < 4, nruns = 5; end


  % load data
  data_file = strcat(dir_exp,'/',dataname,'.dat');
  if exist(data_file,'file') ~= 2
    load(strcat(dir_data,'/',dataname))
    make_lda_c_data_file(full(SX),data_file)
  end
  
  % create settings file 
  settings_file = strcat(dir_exp,'/lda_settings.txt');
  if ~exist(settings_file,'file')
    fid = fopen(settings_file,'w');
    fprintf(fid,'var max iter 20\n');
    fprintf(fid,'var convergence 1e-6\n');
    fprintf(fid,'em max iter 100\n');
    fprintf(fid,'em convergence 1e-4\n');
    if is_estimate_alpha == 1,  
      fprintf(fid,'alpha estimate\n');
    else
      fprintf(fid,'alpha do_not_estimate\n');
    end
    fclose(fid);
  end
  
  objs  = zeros(nruns,1);
  times = zeros(nruns,1);
  Ds    = cell(nruns,1);
  cs    = cell(nruns,1);
  for irun = 1:nruns
    tt = tic;
      irun_dir = strcat(dir_files,'_irun',num2str(irun));
      mkdir(irun_dir)
      c = 0.1/K*ones(K,1);
      lda_estimate( data_file, irun_dir, settings_file, K, c, startoption );
    time = toc(tt);
    
    [D, c, ~, ~, final_likelihood] = lda_read_output(irun_dir);
    objs(irun) = final_likelihood;
    times(irun) = time;
    Ds{irun} = D;
    cs{irun} = c;
  end

  
  [obj,ind] = max(objs);
  time = times(ind);
  D = Ds{ind};
  c = cs{ind};

end
