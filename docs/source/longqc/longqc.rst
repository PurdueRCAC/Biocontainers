.. _backbone-label:

Longqc
==============================

Introduction
~~~~~~~~
LongQC is a tool for the data quality control of the PacBio and ONT long reads.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/cymbopogon/longqc 
| Home page: https://github.com/yfukasawa/LongQC

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.2.0c
  * - BELL
    - 1.2.0c
  * - GAUTSCHI
    - 1.2.0c
  * - NEGISHI
    - 1.2.0c
  * - SCHOLAR
    - 1.2.0c

Commands
~~~~~~~
- longQC.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load longqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run longqc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=longqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers longqc

    longQC.py sampleqc -x pb-rs2 -o out_dir seq.fastq
