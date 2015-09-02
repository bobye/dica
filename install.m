%INSTALL Adds all required paths and builds MEX-files

addpath(pwd);

cd algorithms; addpath(pwd); cd ..
cd algorithms/helpers; addpath(pwd); cd ../..
cd cumulants_and_moments; addpath(pwd); cd ..
cd cumulants_and_moments/helpers; addpath(pwd); cd ../..
cd data/sample; addpath(pwd); cd ../..
cd data/sample/helpers; addpath(pwd); cd ../../..
cd estimation; addpath(pwd); cd ..
cd estimation/helpers; addpath(pwd); cd ../..

cd algorithms/helpers; make_jd; cd ../..
