.. _backbone-label:

Bandage-ng
==============================

Introduction
~~~~~~~~
Bandage-NG is a GUI program that allows users to interact with the assembly graphs made by de novo assemblers such as SPAdes, MEGAHIT and others.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bandage_ng 
| Home page: https://github.com/asl/BandageNG

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2022.09
  * - BELL
    - 2022.09
  * - GAUTSCHI
    - 2022.09
  * - NEGISHI
    - 2022.09

Commands
~~~~~~~
- Bandage

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bandage-ng

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bandage-ng on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bandage-ng
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bandage-ng
