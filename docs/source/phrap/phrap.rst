.. _backbone-label:

phrap
==============================

Introduction
~~~~~~~~
``phrap`` is a program for assembling shotgun DNA sequence data. 

| For more information, please check its home page: http://www.phrap.org/phredphrapconsed.html#block_phrap.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.090518
  * - BELL
    - 1.090518
  * - GAUTSCHI
    - 1.090518
  * - NEGISHI
    - 1.090518
  * - SCHOLAR
    - 1.090518

Commands
~~~~~~~
- phrap

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load phrap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phrap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phrap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phrap
