.. _backbone-label:

Coverm
==============================

Introduction
~~~~~~~~
Coverm is a configurable, easy to use and fast DNA read coverage and relative abundance calculator focused on metagenomics applications.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/coverm 
| Home page:  https://github.com/wwood/CoverM

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.6.1

Commands
~~~~~~~
- coverm

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load coverm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run coverm on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=coverm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers coverm

