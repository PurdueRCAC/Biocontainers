.. _backbone-label:

Gambit
==============================

Introduction
~~~~~~~~
GAMBIT (Genomic Approximation Method for Bacterial Identification and Tracking) is a tool for rapid taxonomic identification of microbial pathogens.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/gambit 
| Home page: https://github.com/jlumpe/gambit

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.5.0
  * - BELL
    - 0.5.0
  * - GAUTSCHI
    - 0.5.0
  * - NEGISHI
    - 0.5.0
  * - SCHOLAR
    - 0.5.0

Commands
~~~~~~~
- gambit

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gambit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gambit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gambit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gambit

    gambit -d database query -o results.csv *.fasta
