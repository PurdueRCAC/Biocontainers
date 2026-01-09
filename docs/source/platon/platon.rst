.. _backbone-label:

Platon
==============================

Introduction
~~~~~~~~
Platon: identification and characterization of bacterial plasmid contigs from short-read draft assemblies.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/platon 
| Home page: https://github.com/oschwengers/platon

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.6
  * - BELL
    - 1.6
  * - GAUTSCHI
    - 1.6
  * - NEGISHI
    - 1.6
  * - SCHOLAR
    - 1.6

Commands
~~~~~~~
- platon

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load platon

.. note::
   The environment variable ``PLATON_DB`` is set as ``/depot/itap/datasets/platon/db``. This directory contains the required database. 

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run platon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=platon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers platon

    platon --verbose --threads 4 contigs.fasta
