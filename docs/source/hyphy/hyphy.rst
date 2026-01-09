.. _backbone-label:

Hyphy
==============================

Introduction
~~~~~~~~
Hyphy is an open-source software package for the analysis of genetic sequences using techniques in phylogenetics, molecular evolution, and machine learning.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/hyphy 
| Home page: https://github.com/veg/hyphy

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.5.36

Commands
~~~~~~~
- hyphy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hyphy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hyphy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hyphy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hyphy

