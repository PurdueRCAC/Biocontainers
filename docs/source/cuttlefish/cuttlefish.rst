.. _backbone-label:

Cuttlefish
==============================

Introduction
~~~~~~~~
Cuttlefish is a fast, parallel, and very lightweight memory tool to construct the compacted de Bruijn graph from sequencing reads or reference sequences. It is highly scalable in terms of the size of the input data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cuttlefish 
| Home page: https://github.com/COMBINE-lab/cuttlefish

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.1.1
  * - BELL
    - 2.1.1
  * - GAUTSCHI
    - 2.1.1
  * - NEGISHI
    - 2.1.1
  * - SCHOLAR
    - 2.1.1

Commands
~~~~~~~
- cuttlefish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cuttlefish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cuttlefish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cuttlefish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cuttlefish
