.. _backbone-label:

Scirpy
==============================

Introduction
~~~~~~~~
Scirpy is a scalable python-toolkit to analyse T cell receptor (TCR) or B cell receptor (BCR) repertoires from single-cell RNA sequencing (scRNA-seq) data. It seamlessly integrates with the popular scanpy library and provides various modules for data import, analysis and visualization.
| For more information, please check:
| Home page: https://github.com/scverse/scirpy

Versions
~~~~~~~~
- 0.10.1

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load scirpy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run scirpy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=scirpy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers scirpy
