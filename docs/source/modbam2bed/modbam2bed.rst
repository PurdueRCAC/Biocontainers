.. _backbone-label:

Modbam2bed
==============================

Introduction
~~~~~~~~
Modbam2bed is a program to aggregate modified base counts stored in a modified-base BAM file to a bedMethyl file.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/zeunas/modbam2bed 
| Home page: https://github.com/epi2me-labs/modbam2bed

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
    - 0.9.1
  * - BELL
    - 0.9.1
  * - GAUTSCHI
    - 0.9.1
  * - NEGISHI
    - 0.9.1
  * - SCHOLAR
    - 0.9.1

Commands
~~~~~~~
- modbam2bed

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load modbam2bed

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run modbam2bed on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=modbam2bed
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers modbam2bed
