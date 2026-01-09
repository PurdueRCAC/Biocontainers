.. _backbone-label:

Mlst
==============================

Introduction
~~~~~~~~
Mlst is used to scan contig files against traditional PubMLST typing schemes.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/mlst 
| Home page: https://github.com/tseemann/mlst

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.22.0, 2.23.0
  * - BELL
    - 2.22.0, 2.23.0
  * - GAUTSCHI
    - 2.22.0, 2.23.0
  * - NEGISHI
    - 2.22.0, 2.23.0
  * - SCHOLAR
    - 2.22.0, 2.23.0

Commands
~~~~~~~
- mlst

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mlst

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mlst on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mlst
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mlst

    mlst contigs.fa
    mlst genome.gbk.gz
