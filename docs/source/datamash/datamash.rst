.. _backbone-label:

Datamash
==============================

Introduction
~~~~~~~~
GNU Datamash is a command-line program which performs basic numeric,textual and statistical operations on input textual data files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/datamash 
| Home page: https://www.gnu.org/software/datamash/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.8
  * - BELL
    - 1.8
  * - GAUTSCHI
    - 1.8
  * - NEGISHI
    - 1.8

Commands
~~~~~~~
- datamash

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load datamash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run datamash on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=datamash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers datamash
