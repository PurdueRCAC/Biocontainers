.. _backbone-label:

Tassel
==============================

Introduction
~~~~~~~~
TASSEL is a software package used to evaluate traits associations, evolutionary patterns, and linkage disequilibrium.
| For more information, please check:
| Home page: https://www.maizegenetics.net/tassel

Versions
~~~~~~~~
- 5.0

Commands
~~~~~~~
- run_pipeline.pl
- start_tassel.pl
- Tassel5

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tassel

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tassel on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tassel
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tassel
