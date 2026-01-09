.. _backbone-label:

Gemma
==============================

Introduction
~~~~~~~~
Gemma is a software toolkit for fast application of linear mixed models (LMMs) and related models to genome-wide association studies (GWAS) and other large-scale data sets.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gemma 
| Home page: https://github.com/genetics-statistics/GEMMA

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.98.3

Commands
~~~~~~~
- gemma

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gemma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gemma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gemma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gemma

