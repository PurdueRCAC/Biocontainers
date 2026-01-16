.. _backbone-label:

Trnascan-se
==============================

Introduction
~~~~~~~~
Trnascan-se is a convenient, ready-for-use means to identify tRNA genes in one or more query sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/trnascan-se 
| Home page: http://lowelab.ucsc.edu/tRNAscan-SE/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.0.9
  * - BELL
    - 2.0.9
  * - GAUTSCHI
    - 2.0.9
  * - NEGISHI
    - 2.0.9
  * - SCHOLAR
    - 2.0.9

Commands
~~~~~~~
- tRNAscan-SE

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trnascan-se

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run trnascan-se on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trnascan-se
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trnascan-se
