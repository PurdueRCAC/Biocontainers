.. _backbone-label:

Dragonflye
==============================

Introduction
~~~~~~~~
Dragonflye is a pipeline that aims to make assembling Oxford Nanopore reads quick and easy.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/dragonflye 
| Home page: https://github.com/rpetit3/dragonflye

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.13, 1.0.14
  * - BELL
    - 1.0.13, 1.0.14
  * - GAUTSCHI
    - 1.0.13, 1.0.14
  * - NEGISHI
    - 1.0.13, 1.0.14
  * - SCHOLAR
    - 1.0.13, 1.0.14

Commands
~~~~~~~
- dragonflye

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load dragonflye

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run dragonflye on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=dragonflye
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dragonflye

    dragonflye --cpus 8 \
         --outdir output \
         --reads SRR18498195.fastq
