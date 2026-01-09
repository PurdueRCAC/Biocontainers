.. _backbone-label:

Fq
==============================

Introduction
~~~~~~~~
Fq is a command line utility for manipulating Illumina-generated FastQ files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fq 
| Home page: https://github.com/stjude-rust-labs/fq

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.10.0
  * - BELL
    - 0.10.0
  * - GAUTSCHI
    - 0.10.0
  * - NEGISHI
    - 0.10.0
  * - SCHOLAR
    - 0.10.0

Commands
~~~~~~~
- fq

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fq
