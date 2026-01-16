.. _backbone-label:

Cellbender
==============================

Introduction
~~~~~~~~
Cellbender is a software package for eliminating technical artifacts from high-throughput single-cell RNA sequencing (scRNA-seq) data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cellbender 
| Home page: https://github.com/broadinstitute/CellBender

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
    - 0.2.0, 0.2.2
  * - BELL
    - 0.2.0, 0.2.2
  * - GAUTSCHI
    - 0.2.0, 0.2.2
  * - NEGISHI
    - 0.2.0, 0.2.2
  * - SCHOLAR
    - 0.2.0, 0.2.2

Commands
~~~~~~~
- cellbender

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellbender

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellbender on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellbender
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellbender
