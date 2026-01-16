.. _backbone-label:

Gffread
==============================

Introduction
~~~~~~~~
Gffread is used to validate, filter, convert and perform various other operations on GFF files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gffread 
| Home page: http://ccb.jhu.edu/software/stringtie/gff.shtml

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
    - 0.12.7
  * - BELL
    - 0.12.7
  * - GAUTSCHI
    - 0.12.7
  * - NEGISHI
    - 0.12.7
  * - SCHOLAR
    - 0.12.7

Commands
~~~~~~~
- gffread

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gffread

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gffread on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gffread
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gffread
