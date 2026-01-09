.. _backbone-label:

Reditools3
==============================

Introduction
~~~~~~~~
REDItools: python scripts for RNA editing detection by RNA-Seq data


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/reditools3 
| Home page: https://github.com/BioinfoUNIBA/REDItools

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - NEGISHI
    - 3.4

Commands
~~~~~~~
- reditools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load reditools3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run reditools3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=reditools3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers reditools3
