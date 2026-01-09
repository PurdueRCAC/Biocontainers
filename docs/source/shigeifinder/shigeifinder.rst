.. _backbone-label:

Shigeifinder
==============================

Introduction
~~~~~~~~
Shigeifinder is a tool that is used to identify differentiate Shigella/EIEC using cluster-specific genes and identify the serotype using O-antigen/H-antigen genes.
For more information, please check:
Docker hub: https://hub.docker.com/r/staphb/shigeifinder 
Home page: https://github.com/LanLab/ShigEiFinder

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.3.2
  * - BELL
    - 1.3.2
  * - GAUTSCHI
    - 1.3.2
  * - NEGISHI
    - 1.3.2
  * - SCHOLAR
    - 1.3.2

Commands
~~~~~~~
- shigeifinder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shigeifinder

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shigeifinder on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shigeifinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shigeifinder
