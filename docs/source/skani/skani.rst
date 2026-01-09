.. _backbone-label:

Skani
==============================

Introduction
~~~~~~~~
Skani is a program for calculating average nucleotide identity (ANI) from DNA sequences (contigs/MAGs/genomes) for ANI > ~80%.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/skani 
| Home page: https://github.com/bluenote-1577/skani

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.2.0
  * - BELL
    - 0.2.0
  * - GAUTSCHI
    - 0.2.0
  * - NEGISHI
    - 0.2.0

Commands
~~~~~~~
- skani

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load skani

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run skani on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=skani
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers skani
