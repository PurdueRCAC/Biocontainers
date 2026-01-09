.. _backbone-label:

IQ-TREE
==============================

Introduction
~~~~~~~~
``IQ-TREE`` is an efficient phylogenomic software by maximum likelihood. 

| For more information, please check its website: https://biocontainers.pro/tools/iqtree and its home page: http://www.iqtree.org.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.6.12, 2.1.2, 2.2.0_beta, 2.2.2.2
  * - BELL
    - 1.6.12, 2.1.2, 2.2.0_beta, 2.2.2.2
  * - GAUTSCHI
    - 1.6.12, 2.1.2, 2.2.0_beta, 2.2.2.2
  * - NEGISHI
    - 1.6.12, 2.1.2, 2.2.0_beta, 2.2.2.2
  * - SCHOLAR
    - 1.6.12, 2.1.2, 2.2.0_beta, 2.2.2.2

Commands
~~~~~~~
- iqtree

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load iqtree

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run IQ-TREE on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=iqtree
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers iqtree

    iqtree -s input.phy -m GTR+I+G > test.out
