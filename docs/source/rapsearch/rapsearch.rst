.. _backbone-label:

Rapsearch
==============================

Introduction
~~~~~~~~
RAPSearch2 is a tool for fast protein similarity searches


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rapsearch 
| Home page: https://rapsearch2.sourceforge.net/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - BELL
    - 2.24
  * - NEGISHI
    - 2.24

Commands
~~~~~~~
- rapsearch
- prerapsearch

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rapsearch

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rapsearch on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rapsearch
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rapsearch
