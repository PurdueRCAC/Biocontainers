.. _backbone-label:

Ataqv
==============================

Introduction
~~~~~~~~
Ataqv is a toolkit for measuring and comparing ATAC-seq results, made in the Parker lab at the University of Michigan.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ataqv 
| Home page: https://github.com/ParkerLab/ataqv

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.3.0
  * - BELL
    - 1.3.0
  * - GAUTSCHI
    - 1.3.0
  * - NEGISHI
    - 1.3.0
  * - SCHOLAR
    - 1.3.0

Commands
~~~~~~~
- ataqv
- mkarv

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ataqv

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ataqv on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ataqv
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ataqv
