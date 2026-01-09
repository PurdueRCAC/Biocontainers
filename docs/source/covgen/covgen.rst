.. _backbone-label:

Covgen
==============================

Introduction
~~~~~~~~
Covgen creates a target specific exome_full192.coverage.txt file required by MutSig.


| For more information, please check:
| Home page: https://github.com/tgen/CovGen

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.2
  * - BELL
    - 1.0.2
  * - GAUTSCHI
    - 1.0.2
  * - NEGISHI
    - 1.0.2
  * - SCHOLAR
    - 1.0.2

Commands
~~~~~~~
- CovGen

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load covgen

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run covgen on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=covgen
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers covgen
