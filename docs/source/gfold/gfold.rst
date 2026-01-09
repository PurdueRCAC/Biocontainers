.. _backbone-label:

Gfold
==============================

Introduction
~~~~~~~~
Generalized fold change for ranking differentially expressed genes from RNA-seq data


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gfold 
| Home page: https://zhanglab.tongji.edu.cn/softwares/GFOLD/index.html

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.4

Commands
~~~~~~~
- gfold

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gfold

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gfold on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gfold
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gfold

