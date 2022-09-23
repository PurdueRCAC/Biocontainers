.. _backbone-label:

Gimmemotifs
==============================

Introduction
~~~~~~~~
GimmeMotifs is a suite of motif tools, including a motif prediction pipeline for ChIP-seq experiments.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/gimmemotifs 
Home page: https://github.com/vanheeringen-lab/gimmemotifs

Versions
~~~~~~~~
- 0.17.1

Commands
~~~~~~~
- gimme
- 

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gimmemotifs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gimmemotifs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gimmemotifs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gimmemotifs
<<<<<<< HEAD

=======
>>>>>>> c6da941f688db250c92ddde17bb514a3508297a7
