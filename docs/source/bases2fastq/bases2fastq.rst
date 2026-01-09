.. _backbone-label:

Bases2fastq
==============================

Introduction
~~~~~~~~
Bases2Fastq software processes sequencing data and converts base calls into FASTQ files. During a sequencing run, the Element AVITI™ System records base calls and associated quality scores (Q-scores) in bases files. Bases2Fastq converts the bases files into the FASTQ file format for secondary analysis with the FASTQ-compatible software of your choice.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bases2fastq 
| Home page: https://docs.elembio.io/docs/bases2fastq/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.7
  * - BELL
    - 1.7, 2.2.0
  * - GAUTSCHI
    - 1.7, 2.2.0
  * - NEGISHI
    - 1.7, 2.2.0

Commands
~~~~~~~
- bases2fastq

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bases2fastq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bases2fastq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bases2fastq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bases2fastq
