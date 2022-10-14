.. _backbone-label:

Scvi-tools
==============================

Introduction
~~~~~~~~
scvi-tools (single-cell variational inference tools) is a package for end-to-end analysis of single-cell omics data primarily developed and maintained by the Yosef Lab at UC Berkeley.

| For more information, please check:
| Home page: https://scvi-tools.org

Versions
~~~~~~~~
- 0.16.2

Commands
~~~~~~~
- python
- python3
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load scvi-tools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run scvi-tools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=scvi-tools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers scvi-tools
