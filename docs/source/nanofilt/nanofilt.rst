.. _backbone-label:

Nanofilt
==============================

Introduction
~~~~~~~~
``Nanofilt`` is a tool for filtering and trimming of Oxford Nanopore Sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/nanofilt and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.8.0
  * - BELL
    - 2.8.0
  * - GAUTSCHI
    - 2.8.0
  * - NEGISHI
    - 2.8.0
  * - SCHOLAR
    - 2.8.0

Commands
~~~~~~~
- NanoFilt

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nanofilt

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nanofilt on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nanofilt
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanofilt

    NanoFilt -q 12 --headcrop 75 reads.fastq |  gzip > trimmed-reads.fastq.gz
  
.. _Github: https://github.com/wdecoster/nanofilt
