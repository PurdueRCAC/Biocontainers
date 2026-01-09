.. _backbone-label:

T-coffee
==============================

Introduction
~~~~~~~~
``T-coffee`` is a multiple sequence alignment software using a progressive approach. 

| For more information, please check its website: https://biocontainers.pro/tools/t-coffee and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 13.45.0.4846264
  * - BELL
    - 13.45.0.4846264
  * - GAUTSCHI
    - 13.45.0.4846264
  * - NEGISHI
    - 13.45.0.4846264
  * - SCHOLAR
    - 13.45.0.4846264

Commands
~~~~~~~
- t_coffee

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load t-coffee

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run T-coffee on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=t-coffee
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers t-coffee

    t_coffee  OG0002077.fa -mode  expresso
.. _Github: https://github.com/cbcrg/tcoffee
