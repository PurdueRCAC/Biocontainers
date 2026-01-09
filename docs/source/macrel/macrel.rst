.. _backbone-label:

Macrel
==============================

Introduction
~~~~~~~~
Macrel is a pipeline to mine antimicrobial peptides (AMPs) from (meta)genomes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/macrel 
| Home page: https://github.com/BigDataBiology/macrel

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

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
- macrel

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load macrel

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run macrel on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=macrel
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers macrel
