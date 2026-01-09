.. _backbone-label:

Kmergenie
==============================

Introduction
~~~~~~~~
KmerGenie estimates the best k-mer length for genome de novo assembly.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/kmergenie 
| Home page: http://kmergenie.bx.psu.edu

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.7051
  * - BELL
    - 1.7051
  * - GAUTSCHI
    - 1.7051
  * - NEGISHI
    - 1.7051
  * - SCHOLAR
    - 1.7051

Commands
~~~~~~~
- kmergenie

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kmergenie

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kmergenie on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kmergenie
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kmergenie
