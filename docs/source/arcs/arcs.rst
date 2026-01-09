.. _backbone-label:

Arcs
==============================

Introduction
~~~~~~~~
ARCS is a tool for scaffolding genome sequence assemblies using linked or long read sequencing data.


| For more information, please check:
| Home page: https://github.com/bcgsc/arcs

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.4
  * - BELL
    - 1.2.4
  * - GAUTSCHI
    - 1.2.4
  * - NEGISHI
    - 1.2.4
  * - SCHOLAR
    - 1.2.4

Commands
~~~~~~~
- arcs
- arcs-make

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load arcs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run arcs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=arcs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers arcs
