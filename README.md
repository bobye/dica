## Rethinking LDA: moment matching for DICA

## About
This project contains implementations of some moment matching algorithms for topic modeling. In brief, these algorithms are based on construction of moments / cumulants tensors from the data and matching them to the respective theoretical expressions in order to learn model's parameters.

The code is twofold. One part contains efficient implementation for construction of the moments / cumulants tensors, while the other part contains implementation of several so called joint diagonalization type algorithms used for matching the tensors. Any tensor type can be arbitrary combined with one of the diagonalization algorithms (leading, in total, to 6 algorithms).

The focus is on the **latent Dirichlet allocation** (LDA) and **discrete independent component analysis** (DICA) models. Importantly, the latter model was shown to be similar and sometimes equivalent to the former. Respectively, two types of the tensors are considered: the LDA moments and the DICA cumulants. The theoretical expressions for the LDA moments were previously derived by Anima Anandkumar, Dean P. Foster, Daniel Hsu, Sham M. Kakade, Yi-Kai Liu in A Spectral Algorithm for Latent Dirichlet Allocation. Algorithmica 72(1): 193-214 (2015). The expressions for the DICA cumulants are derived in our paper (see below).

The diagonalization type algorithms include the **spectral algorithm** (spectral) based on two eigen decompositions, the **orthogonal joint diagonalization algorithm** (jd), and the **tensor power method** (tpm).

Overall, (a) the theoretical part of the project is [here](http://www.di.ens.fr/~apodosin/dica-project.html) and (b) the project contains Matlab/C++ implementation of the algorithms and the data sets for the paper
* A. Podosinnikova, F. Bach, S. Lacoste-Julien. Rethinking LDA: moment matching for discrete ICA. Technical report [arXiv:1507.01784](http://arxiv.org/abs/1507.01784), 2015.








## Quick start

1. to save all required paths and build mex files, run ```install.m```
2. to run examples of all algorithms, run  ```examples_topic_modeling_algorithms.m```
3. to run an example of joint diagonalization, run ```example_joint_diagonalization.m```
4. to sample the semi-toy data from our experiments, run ```sample_semi_toy_data.m```
5. to obtain the real data from our experiments, check ```data/real```
6. when finished, remove all paths with ```deinstall.m```
