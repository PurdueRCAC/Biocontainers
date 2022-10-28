.. _backbone-label:

MrBayes
==============================

Introduction
~~~~~~~~
``MrBayes`` is a program for Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models. MrBayes uses Markov chain Monte Carlo (MCMC) methods to estimate the posterior distribution of model parameters.

MrBayes is available both in a serial version ('mb') and in a parallel version ('mb-mpi') that uses MPI instructions to distribute computations across several processors or processor cores. The serial version does *not* support multi-threading, which means that you will not be able to utilize more than one core on a multi-core machine for a single MrBayes analysis. If you want to utilize all cores,you need to run the MPI version of MrBayes.

Note: 'mb-mpi' in this version of the container does not run across multiple nodes (only within a node). This is a bug in the container (upstream).



| For more information, please check its website: https://biocontainers.pro/tools/mrbayes and its home page: http://mrbayes.net.

Versions
~~~~~~~~
- 3.2.7

Commands
~~~~~~~
- mb
- mb-mpi
- mpirun
- mpiexec

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mrbayes

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MrBayes on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mrbayes
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mrbayes
