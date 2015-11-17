### Rethinking LDA: moment matching for Discrete ICA

If you are only interested in the implementations of the algorithms, but not reproducing the experiments from out paper (see below), 
check [this](https://github.com/anastasia-podosinnikova/dica-light) repo.

#### About
This project contains implementations of some moment matching algorithms for topic modeling. 
In brief, these algorithms are based on the construction of moment/cumulant tensors from the data 
and matching them to the respective theoretical expressions in order to learn the parameters of the model.

The implementation of the algorithms consitst of two parts. 
One part contains the efficient implementation for construction of the moment/cumulant tensors, 
while the other part contains implementations of several so called joint diagonalization type algorithms used for matching the tensors. 
Any tensor type (see below) can be arbitrarily combined with one of the diagonalization algorithms (leading, in total, to 6 algorithms).

The focus is on the **latent Dirichlet allocation** (LDA) and **discrete independent component analysis** (DICA) models. 
Importantly, the latter model was shown to be similar and sometimes equivalent to the former. 
Respectively, two types of the tensors are considered: the LDA moments and the DICA cumulants. 
The theoretical expressions for the LDA moments were previously derived 
by Anima Anandkumar, Dean P. Foster, Daniel Hsu, Sham M. Kakade, Yi-Kai Liu 
in A Spectral Algorithm for Latent Dirichlet Allocation. Algorithmica 72(1): 193-214 (2015). 
The expressions for the DICA cumulants are derived in our paper (see below).

The diagonalization type algorithms include the **spectral algorithm** (spectral) based on two eigen decompositions, 
the **orthogonal joint diagonalization algorithm** (jd), and the **tensor power method** (tpm).

Overall, (a) the theoretical part of the project is [here](http://www.di.ens.fr/~apodosin/dica-project.html) 
and (b) the project contains Matlab/C++ implementation of the algorithms and the scripts for repruducing all the experiments from the paper
* A. Podosinnikova, F. Bach, S. Lacoste-Julien. [Rethinking LDA: moment matching for discrete ICA](http://arxiv.org/abs/1507.01784). NIPS, 2015.








#### Quick start

1. make sure your Matlab recognizes a C++ compiler: ```mex -setup```
2. save all required paths and build mex files: ```install.m```
3. reproduce experiments: ```reproduce_fig_*```
4. sample the semi-toy data from our experiments: ```sample_semi_toy_data.m```
5. the real data from our experiments can be found in ```data/real```
6. make the plots without rerunning the experiments: ```show_plots_from_the_paper.m```
7. when finished, remove all paths with ```deinstall.m```


#### Questions?
Do not hesitate to contact me: firstname.lastname@inria.fr (Anastasia Podosinnikova)
