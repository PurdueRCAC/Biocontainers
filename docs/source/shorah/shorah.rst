.. _backbone-label:

Shorah
==============================

Introduction
~~~~~~~~
Shorah is an open source project for the analysis of next generation sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/shorah 
| Home page: https://github.com/cbg-ethz/shorah

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
    - 1.99.2
  * - BELL
    - 1.99.2
  * - GAUTSCHI
    - 1.99.2
  * - NEGISHI
    - 1.99.2
  * - SCHOLAR
    - 1.99.2

Commands
~~~~~~~
- shorah
- b2w
- diri_sampler
- fil

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shorah

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shorah on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shorah
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shorah
