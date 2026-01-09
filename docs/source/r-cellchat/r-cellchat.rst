.. _backbone-label:

R-cellchat
==============================

Introduction
~~~~~~~~
CellChat: Inference and analysis of cell-cell communication.


| For more information, please check:
| Home page: https://github.com/sqjin/CellChat

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.5.0
  * - BELL
    - 1.5.0
  * - GAUTSCHI
    - 1.5.0
  * - NEGISHI
    - 1.5.0
  * - SCHOLAR
    - 1.5.0

Commands
~~~~~~~
- R
- Rscript
- rstudio

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r-cellchat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-cellchat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-cellchat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-cellchat
