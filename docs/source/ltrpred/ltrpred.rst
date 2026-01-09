.. _backbone-label:

Ltrpred
==============================

Introduction
~~~~~~~~
LTRpred(ict): de novo annotation of young and intact retrotransposons.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/drostlab/ltrpred 
| Home page: https://github.com/HajkD/LTRpred

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.1.0
  * - BELL
    - 1.1.0
  * - GAUTSCHI
    - 1.1.0
  * - NEGISHI
    - 1.1.0
  * - SCHOLAR
    - 1.1.0

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ltrpred

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ltrpred on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ltrpred
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ltrpred
