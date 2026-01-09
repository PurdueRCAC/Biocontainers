.. _backbone-label:

Snap
==============================

Introduction
~~~~~~~~
``Snap`` is a semi-HMM-based Nucleic Acid Parser -- gene prediction tool. 

| For more information, please check its website: https://biocontainers.pro/tools/snap and its home page: http://korflab.ucdavis.edu/software.html.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2013_11_29
  * - BELL
    - 2013_11_29
  * - GAUTSCHI
    - 2013_11_29
  * - NEGISHI
    - 2013_11_29
  * - SCHOLAR
    - 2013_11_29

Commands
~~~~~~~
- snap

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Snap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snap
