% DEINSTALL Removes all pathes added by install.m

rmpath(pwd);

cd algorithms; rmpath(pwd); cd ..
cd algorithms/helpers; rmpath(pwd); cd ../..
cd algorithms/helpers_lda; rmpath(pwd); cd ../..

cd cumulants_and_moments; rmpath(pwd); cd ..
cd cumulants_and_moments/helpers; rmpath(pwd); cd ../..

cd estimation; rmpath(pwd); cd ..
cd estimation/helpers; rmpath(pwd); cd ../..
cd estimation/lda_eval_wallach; rmpath(pwd); cd ../..

cd scripts; rmpath(pwd); cd ..
cd scripts/experiments_setup; rmpath(pwd); cd ../..
cd scripts/helpers; rmpath(pwd); cd ../..
cd scripts/make_figures; rmpath(pwd); cd ../..
cd scripts/make_figures/helpers; rmpath(pwd); cd ../../..
cd scripts/run_experiments; rmpath(pwd); cd ../..
cd scripts/run_experiments/helpers; rmpath(pwd); cd ../../..
cd scripts/sample_data; rmpath(pwd); cd ../..
cd scripts/sample_data/helpers; rmpath(pwd); cd ../../..
