.. _backbone-label:

Jvarkit
==============================

Introduction
~~~~~~~~
Jvarkit is a collection of Java utilities for Bioinformatics.


| For more information, please check:
| Home page: https://github.com/lindenb/jvarkit

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2023.06.27
  * - BELL
    - 2023.06.27
  * - GAUTSCHI
    - 2023.06.27
  * - NEGISHI
    - 2023.06.27

Commands
~~~~~~~
- java

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load jvarkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run jvarkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=jvarkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers jvarkit
