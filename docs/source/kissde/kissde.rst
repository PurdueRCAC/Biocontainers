.. _backbone-label:

Kissde
==============================

Introduction
~~~~~~~~
kissDE is a R package, similar to DEseq, but which works on pairs of variants, and tests if a variant is enriched in one condition. It has been developped to work easily with KisSplice output. It can also work with a simple table of counts obtained by any other means. It requires at least two replicates per condition and at least two conditions.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dwishsan/kissplice-pipeline 
| Home page: https://kissplice.prabi.fr

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.15.3
  * - BELL
    - 1.15.3
  * - GAUTSCHI
    - 1.15.3
  * - NEGISHI
    - 1.15.3
  * - SCHOLAR
    - 1.15.3

Commands
~~~~~~~
- R
- Rscript
- kissDE.R

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kissde

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kissde on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kissde
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kissde
