.. _backbone-label:

rush
==============================

Introduction
~~~~~~~~
``rush`` is a tool similar to GNU parallel and gargs. rush borrows some idea from them and has some unique features, e.g., supporting custom defined variables, resuming multi-line commands, more advanced embeded replacement strings. 

| For more information, please check its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.4.2
  * - BELL
    - 0.4.2
  * - GAUTSCHI
    - 0.4.2
  * - NEGISHI
    - 0.4.2
  * - SCHOLAR
    - 0.4.2

Commands
~~~~~~~
- rush

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load rush

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rush on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rush
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rush

.. _Github: https://github.com/shenwei356/rush
