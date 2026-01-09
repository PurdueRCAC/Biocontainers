.. _backbone-label:

Rapmap
==============================

Introduction
~~~~~~~~
RapMap is a testing ground for ideas in quasi-mapping and selective alignment.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rapmap 
| Home page: https://github.com/COMBINE-lab/RapMap

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.6.0
  * - BELL
    - 0.6.0
  * - GAUTSCHI
    - 0.6.0
  * - NEGISHI
    - 0.6.0
  * - SCHOLAR
    - 0.6.0

Commands
~~~~~~~
- rapmap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rapmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rapmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rapmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rapmap
