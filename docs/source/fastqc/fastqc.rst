.. _backbone-label:

FastQC
==============================

Introduction
~~~~~~~~
``FastQC`` aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines. It provides a modular set of analyses which you can use to give a quick impression of whether your data has any problems of which you should be aware before doing any further analysis. 

| For more information, please check its website: https://biocontainers.pro/tools/fastqc and its home page: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.11.9, 0.12.1
  * - BELL
    - 0.11.9, 0.12.1
  * - GAUTSCHI
    - 0.11.9, 0.12.1
  * - NEGISHI
    - 0.11.9, 0.12.1
  * - SCHOLAR
    - 0.11.9, 0.12.1

Commands
~~~~~~~
- fastqc

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fastqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Fastqc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=fastqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastqc

    fastqc -o fastqc_out -t 4 FASTQ1 FASTQ2
