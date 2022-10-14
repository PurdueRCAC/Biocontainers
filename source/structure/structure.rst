.. _backbone-label:

Structure
==============================

Introduction
~~~~~~~~
Structure is a software package for using multi-locus genotype data to investigate population structure.

| For more information, please check:
| Home page: https://web.stanford.edu/group/pritchardlab/structure.html

Versions
~~~~~~~~
- 2.3.4

Commands
~~~~~~~
- structure

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load structure

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run structure on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=structure
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers structure
