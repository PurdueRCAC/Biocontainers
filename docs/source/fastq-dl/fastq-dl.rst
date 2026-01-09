.. _backbone-label:

Fastq-dl
==============================

Introduction
~~~~~~~~
Fastq-dl is ###############################################################


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/fastq-dl 
| Home page: ########################

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - BELL
    - 2.0.4
  * - GAUTSCHI
    - 2.0.4
  * - NEGISHI
    - 2.0.4

Commands
~~~~~~~
- fastq-dl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fastq-dl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fastq-dl on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastq-dl
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastq-dl
