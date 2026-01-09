.. _backbone-label:

Samblaster
==============================

Introduction
~~~~~~~~
``Samblaster`` is a tool to mark duplicates and extract discordant and split reads from sam files. 

| For more information, please check its website: https://biocontainers.pro/tools/samblaster and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.1.26
  * - BELL
    - 0.1.26
  * - GAUTSCHI
    - 0.1.26
  * - NEGISHI
    - 0.1.26
  * - SCHOLAR
    - 0.1.26

Commands
~~~~~~~
- samblaster

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load samblaster

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Samblaster on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=samblaster
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers samblaster

.. _Github: https://github.com/GregoryFaust/samblaster
