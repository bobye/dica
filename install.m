%INSTALL Adds all required paths and builds MEX-files

addpath(pwd);

cd algorithms; addpath(pwd); cd ..
cd algorithms/helpers; addpath(pwd); cd ../..
cd algorithms/helpers_lda; addpath(pwd); cd ../..

cd cumulants_and_moments; addpath(pwd); cd ..
cd cumulants_and_moments/helpers; addpath(pwd); cd ../..

cd estimation; addpath(pwd); cd ..
cd estimation/helpers; addpath(pwd); cd ../..
cd estimation/lda_eval_wallach; addpath(pwd); cd ../..

cd scripts; addpath(pwd); cd ..
cd scripts/experiments_setup; addpath(pwd); cd ../..
cd scripts/helpers; addpath(pwd); cd ../..
cd scripts/make_figures; addpath(pwd); cd ../..
cd scripts/make_figures/helpers; addpath(pwd); cd ../../..
cd scripts/run_experiments; addpath(pwd); cd ../..
cd scripts/run_experiments/helpers; addpath(pwd); cd ../../..
cd scripts/sample_data; addpath(pwd); cd ../..
cd scripts/sample_data/helpers; addpath(pwd); cd ../../..

% build MEX-files
cd algorithms/helpers; make_jd; cd ../..

if exist('lda_estimate.m','file')~=2
  error(['Files for the lda-c-modif library were not found;', ...
    ' the library can be found at https://github.com/anastasia-podosinnikova/lda-c-modif;'...
    ' to install the library type install after setting up C++ compiler'])
end
