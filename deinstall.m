% DEINSTALL Removes all pathes added by install.m

rmpath(pwd);

cd algorithms; rmpath(pwd); cd ..
cd algorithms/helpers; rmpath(pwd); cd ../..
cd cumulants_and_moments; rmpath(pwd); cd ..
cd cumulants_and_moments/helpers; rmpath(pwd); cd ../..
cd data/sample; rmpath(pwd); cd ../..
cd data/sample/helpers; rmpath(pwd); cd ../../..
cd estimation; rmpath(pwd); cd ..
cd estimation/helpers; rmpath(pwd); cd ../..

