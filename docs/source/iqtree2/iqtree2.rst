.. _backbone-label:

Iqtree2
==============================

Introduction
~~~~~~~~
IQ-TREE is an efficient phylogenomic software by maximum likelihood.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/iqtree 
| Home page: http://www.iqtree.org

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.2.2.6, 2.2.2.9
  * - BELL
    - 2.2.2.6, 2.2.2.9
  * - GAUTSCHI
    - 2.2.2.6, 2.2.2.9
  * - NEGISHI
    - 2.2.2.6, 2.2.2.9
  * - SCHOLAR
    - 2.2.2.6, 2.2.2.9

Commands
~~~~~~~
- iqtree2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load iqtree2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run iqtree2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=iqtree2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers iqtree2
