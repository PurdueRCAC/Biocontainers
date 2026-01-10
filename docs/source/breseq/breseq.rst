.. _backbone-label:

Breseq
==============================

Introduction
~~~~~~~~
Breseq is a computational pipeline for the analysis of short-read re-sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/breseq 
| Home page: https://github.com/barricklab/breseq

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
    - 0.36.1
  * - BELL
    - 0.36.1
  * - GAUTSCHI
    - 0.36.1
  * - NEGISHI
    - 0.36.1
  * - SCHOLAR
    - 0.36.1

Commands
~~~~~~~
- breseq

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load breseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run breseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=breseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers breseq
