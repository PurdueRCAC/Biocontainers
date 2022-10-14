.. _backbone-label:

Kma
==============================

Introduction
~~~~~~~~
KMA is a mapping method designed to map raw reads directly against redundant databases, in an ultra-fast manner using seed and extend.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/kma 
|Home page: https://bitbucket.org/genomicepidemiology/kma/src/master/

Versions
~~~~~~~~
- 1.4.3

Commands
~~~~~~~
- kma
- kma_index
- kma_shm
- kma_update

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kma
