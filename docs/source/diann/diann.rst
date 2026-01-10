.. _backbone-label:

Diann
==============================

Introduction
~~~~~~~~
DIA-NN is an automated software suite for data-independent acquisition (DIA) proteomics data processing


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/diann 
| Home page: https://github.com/vdemichev/DiaNN

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

  * - NEGISHI
    - 2.0.2
  * - SCHOLAR
    - 2.0.2

Commands
~~~~~~~
- diann-linux

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load diann

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run diann on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=diann
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers diann
