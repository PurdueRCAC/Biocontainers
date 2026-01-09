.. _backbone-label:

Pblat
==============================

Introduction
~~~~~~~~
pblat is parallelized blat with multi-threads support.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pblat 
| Home page: https://github.com/icebert/pblat

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.5.1
  * - BELL
    - 2.5.1
  * - GAUTSCHI
    - 2.5.1
  * - NEGISHI
    - 2.5.1
  * - SCHOLAR
    - 2.5.1

Commands
~~~~~~~
- pblat

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pblat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pblat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pblat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pblat
