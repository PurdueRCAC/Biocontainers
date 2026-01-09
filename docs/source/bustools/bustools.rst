.. _backbone-label:

Bustools
==============================

Introduction
~~~~~~~~
Bustools is a program for manipulating BUS files for single cell RNA-Seq datasets.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bustools 
| Home page: https://github.com/BUStools/bustools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.41.0

Commands
~~~~~~~
- bustools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bustools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bustools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bustools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bustools

