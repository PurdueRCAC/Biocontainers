.. _backbone-label:

swat
==============================

Introduction
~~~~~~~~
``swat`` is a program for searching one or more DNA or protein query sequences, or a query profile, against a sequence database, using an efficient implementation of the Smith-Waterman or Needleman-Wunsch algorithms with linear (affine) gap penalties. | For more information, please check its home page: http://www.phrap.org/phredphrapconsed.html#block_phrap.

Versions
~~~~~~~~
- 1.090518

Commands
~~~~~~~
- swat

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load swat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run swat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=swat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers swat
