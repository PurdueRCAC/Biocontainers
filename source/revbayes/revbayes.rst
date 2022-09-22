.. _backbone-label:

Revbayes
==============================

Introduction
~~~~~~~~
RevBayes -- Bayesian phylogenetic inference using probabilistic graphical models and an interactive language.
For more information, please check:
Home page: https://github.com/revbayes/revbayes

Versions
~~~~~~~~
- 1.1.1

Commands
~~~~~~~
- rb
- rb-mpi

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load revbayes

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run revbayes on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=revbayes
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers revbayes
