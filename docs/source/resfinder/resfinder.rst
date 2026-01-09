.. _backbone-label:

Resfinder
==============================

Introduction
~~~~~~~~
ResFinder identifies acquired antimicrobial resistance genes in total or partial sequenced isolates of bacteria.


| For more information, please check:
| Home page: https://github.com/cadms/resfinder

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 4.1.5
  * - BELL
    - 4.1.5
  * - GAUTSCHI
    - 4.1.5
  * - NEGISHI
    - 4.1.5
  * - SCHOLAR
    - 4.1.5

Commands
~~~~~~~
- run_resfinder.py
- run_batch_resfinder.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load resfinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run resfinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=resfinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers resfinder

    run_resfinder.py -o output -db_res db_resfinder/ \
         -db_res_kma db_resfinder/kma_indexing -db_point db_pointfinder/ \
         -s "Escherichia coli" --acquired --point -ifq data/test_isolate_01_*
