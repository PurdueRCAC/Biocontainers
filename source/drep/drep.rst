.. _backbone-label:

Drep
==============================

Introduction
~~~~~~~~
``Drep`` is a python program for rapidly comparing large numbers of genomes. | For more information, please check its website: https://biocontainers.pro/tools/drep and its home page on `Github`_.

Versions
~~~~~~~~
- 3.2.2

Commands
~~~~~~~
- dRep

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load drep

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Drep on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=drep
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers drep

    dRep compare compare_out -g tests/genomes/*
    dRep dereplicate dereplicate_out -g tests/genomes/* 

.. _Github: https://github.com/MrOlm/drep
