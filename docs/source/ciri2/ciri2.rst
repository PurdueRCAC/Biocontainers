.. _backbone-label:

Ciri2
==============================

Introduction
~~~~~~~~
CIRI2: Circular RNA identification based on multiple seed matching


| For more information, please check:
| Home page: https://sourceforge.net/projects/ciri/files/CIRI2/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.0.6
  * - BELL
    - 2.0.6
  * - GAUTSCHI
    - 2.0.6
  * - NEGISHI
    - 2.0.6
  * - SCHOLAR
    - 2.0.6

Commands
~~~~~~~
- CIRI2.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ciri2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ciri2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ciri2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ciri2
