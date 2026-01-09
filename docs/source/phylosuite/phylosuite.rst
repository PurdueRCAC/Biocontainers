.. _backbone-label:

Phylosuite
==============================

Introduction
~~~~~~~~
PhyloSuite is an integrated and scalable desktop platform for streamlined molecular sequence data management and evolutionary phylogenetics studies.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dongzhang0725/phylosuite 
| Home page: https://github.com/dongzhang0725/PhyloSuite

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.3
  * - BELL
    - 1.2.3
  * - GAUTSCHI
    - 1.2.3
  * - NEGISHI
    - 1.2.3
  * - SCHOLAR
    - 1.2.3

Commands
~~~~~~~
- PhyloSuite.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phylosuite

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phylosuite on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phylosuite
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phylosuite
