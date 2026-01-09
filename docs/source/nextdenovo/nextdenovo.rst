.. _backbone-label:

Nextdenovo
==============================

Introduction
~~~~~~~~
NextDenovo is a string graph-based de novo assembler for long reads (CLR, HiFi and ONT). It uses a "correct-then-assemble" strategy similar to canu (no correction step for PacBio HiFi reads), but requires significantly less computing resources and storages. After assembly, the per-base accuracy is about 98-99.8%, to further improve single base accuracy, try NextPolish.


| For more information, please check:
| Home page: https://github.com/Nextomics/NextDenovo

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.5.2
  * - BELL
    - 2.5.2
  * - GAUTSCHI
    - 2.5.2
  * - NEGISHI
    - 2.5.2
  * - SCHOLAR
    - 2.5.2

Commands
~~~~~~~
- nextDenovo

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load nextdenovo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run nextdenovo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nextdenovo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nextdenovo
