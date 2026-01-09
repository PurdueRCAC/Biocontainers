.. _backbone-label:

Mcl
==============================

Introduction
~~~~~~~~
``Mcl`` is short for the Markov Cluster Algorithm, a fast and scalable unsupervised cluster algorithm for graphs. 

| For more information, please check its website: https://biocontainers.pro/tools/mcl and its home page: http://micans.org/mcl/.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 14.137-pl5262
  * - BELL
    - 14.137-pl5262
  * - GAUTSCHI
    - 14.137-pl5262
  * - NEGISHI
    - 14.137-pl5262
  * - SCHOLAR
    - 14.137-pl5262

Commands
~~~~~~~
- clm
- clmformat
- clxdo
- mcl
- mclblastline
- mclcm
- mclpipeline
- mcx
- mcxarray
- mcxassemble
- mcxdeblast
- mcxdump
- mcxi
- mcxload
- mcxmap
- mcxrand
- mcxsubs

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mcl

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mcl on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mcl
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mcl
