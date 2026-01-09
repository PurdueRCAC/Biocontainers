.. _backbone-label:

Agfusion
==============================

Introduction
~~~~~~~~
AGFusion (pronounced 'A G Fusion') is a python package for annotating gene fusions from the human or mouse genomes.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/mgibio/agfusion 
| Home page: https://github.com/murphycj/AGFusion

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.3.11
  * - BELL
    - 1.3.11
  * - GAUTSCHI
    - 1.3.11
  * - NEGISHI
    - 1.3.11
  * - SCHOLAR
    - 1.3.11

Commands
~~~~~~~
- agfusion

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load agfusion

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run agfusion on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=agfusion
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers agfusion
