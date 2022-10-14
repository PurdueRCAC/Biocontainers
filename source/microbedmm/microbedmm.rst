.. _backbone-label:

MicrobeDMM
==============================

Introduction
~~~~~~~~
``MicrobeDMM`` is a suite of programs used for empirical Bayes fitting of DMM models. |For more information, please check its home page: https://code.google.com/archive/p/microbedmm.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- DirichletMixtureGHPFit

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load microbedmm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MicrobeDMM on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=microbedmm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers microbedmm
