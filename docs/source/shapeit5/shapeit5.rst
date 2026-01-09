.. _backbone-label:

Shapeit5
==============================

Introduction
~~~~~~~~
SHAPEIT5 is a software package to estimate haplotypes in large genotype datasets (WGS and SNP array).


| For more information, please check:
| Home page: https://github.com/odelaneau/shapeit5

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 5.1.1
  * - BELL
    - 5.1.1
  * - GAUTSCHI
    - 5.1.1
  * - NEGISHI
    - 5.1.1
  * - SCHOLAR
    - 5.1.1

Commands
~~~~~~~
- phase_common
- ligate
- phase_rare
- simulate
- switch
- xcftools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shapeit5

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shapeit5 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shapeit5
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shapeit5
