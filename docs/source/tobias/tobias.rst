.. _backbone-label:

Tobias
==============================

Introduction
~~~~~~~~
Tobias is a collection of command-line bioinformatics tools for performing footprinting analysis on ATAC-seq data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/tobias 
| Home page: https://github.com/loosolab/TOBIAS

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.13.3

Commands
~~~~~~~
- TOBIAS

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tobias

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tobias on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tobias
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tobias

