.. _backbone-label:

Resfinder
==============================

Introduction
~~~~~~~~
ResFinder identifies acquired antimicrobial resistance genes in total or partial sequenced isolates of bacteria.
For more information, please check:
Home page: https://github.com/cadms/resfinder

Versions
~~~~~~~~
- 4.1.5

Commands
~~~~~~~
- run_resfinder.py
- run_batch_resfinder.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load resfinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run resfinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=resfinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers resfinder
