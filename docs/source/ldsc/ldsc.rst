.. _backbone-label:

Ldsc
==============================

Introduction
~~~~~~~~
ldsc is a command line tool for estimating heritability and genetic correlation from GWAS summary statistics.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ldsc 
| Home page: https://github.com/bulik/ldsc

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.1
  * - BELL
    - 1.0.1
  * - GAUTSCHI
    - 1.0.1
  * - NEGISHI
    - 1.0.1
  * - SCHOLAR
    - 1.0.1

Commands
~~~~~~~
- ldsc.py
- munge_sumstats.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ldsc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ldsc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ldsc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ldsc
