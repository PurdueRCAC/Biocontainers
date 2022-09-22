.. _backbone-label:

Mageck
==============================

Introduction
~~~~~~~~
Model-based Analysis of Genome-wide CRISPR-Cas9 Knockout (MAGeCK) is a computational tool to identify important genes from the recent genome-scale CRISPR-Cas9 knockout screens (or GeCKO) technology.
For more information, please check:
Docker hub: https://hub.docker.com/r/davidliwei/mageck 
Home page: https://bitbucket.org/liulab/mageck/src/master/

Versions
~~~~~~~~
- 0.5.9.5

Commands
~~~~~~~
- mageck
- mageckGSEA
- RRA

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mageck

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mageck on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mageck
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mageck
