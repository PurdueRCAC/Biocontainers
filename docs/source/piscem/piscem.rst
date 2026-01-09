.. _backbone-label:

Piscem
==============================

Introduction
~~~~~~~~
piscem is a rust wrapper for a next-generation index + mapper tool (still currently written in C++17).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/piscem 
| Home page: https://github.com/COMBINE-lab/piscem

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.4.3
  * - BELL
    - 0.4.3
  * - GAUTSCHI
    - 0.4.3
  * - NEGISHI
    - 0.4.3
  * - SCHOLAR
    - 0.4.3

Commands
~~~~~~~
- piscem

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load piscem

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run piscem on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=piscem
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers piscem
