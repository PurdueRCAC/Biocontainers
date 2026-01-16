.. _backbone-label:

Trimmomatic
==============================

Introduction
~~~~~~~~
Trimmomatic is a flexible read trimming tool for Illumina NGS data


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/trimmomatic 
| Home page: http://www.usadellab.org/cms/index.php?pagetrimmomatic

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
    - 0.39
  * - BELL
    - 0.39
  * - GAUTSCHI
    - 0.39
  * - NEGISHI
    - 0.39
  * - SCHOLAR
    - 0.39

Commands
~~~~~~~
- trimmomatic

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trimmomatic

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run trimmomatic on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trimmomatic
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trimmomatic
