.. _backbone-label:

Mashtree
==============================

Introduction
~~~~~~~~
``Mashtree`` is a tool to create a tree using Mash distances. 

| For more information, please check its website: https://biocontainers.pro/tools/mashtree and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.0
  * - BELL
    - 1.2.0
  * - GAUTSCHI
    - 1.2.0
  * - NEGISHI
    - 1.2.0
  * - SCHOLAR
    - 1.2.0

Commands
~~~~~~~
- mashtree
- mashtree_bootstrap.pl
- mashtree_cluster.pl
- mashtree_init.pl
- mashtree_jackknife.pl
- mashtree_wrapper_deprecated.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mashtree

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mashtree on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mashtree
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mashtree

.. _Github: https://github.com/lskatz/mashtree
