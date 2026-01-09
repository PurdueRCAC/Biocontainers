.. _backbone-label:

Mob_suite
==============================

Introduction
~~~~~~~~
MOB-suite: Software tools for clustering, reconstruction and typing of plasmids from draft assemblies.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/kbessonov/mob_suite 
| Home page: https://github.com/phac-nml/mob-suite

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.0.3
  * - BELL
    - 3.0.3
  * - GAUTSCHI
    - 3.0.3
  * - NEGISHI
    - 3.0.3
  * - SCHOLAR
    - 3.0.3

Commands
~~~~~~~
- mob_cluster
- mob_init
- mob_recon
- mob_typer

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mob_suite

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mob_suite on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mob_suite
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mob_suite
