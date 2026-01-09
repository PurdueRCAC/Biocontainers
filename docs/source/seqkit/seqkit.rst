.. _backbone-label:

Seqkit
==============================

Introduction
~~~~~~~~
``Seqkit`` is a rapid tool for manipulating fasta and fastq files. 

| For more information, please check its website: https://biocontainers.pro/tools/seqkit and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.0.0, 2.1.0, 2.3.1
  * - BELL
    - 2.0.0, 2.1.0, 2.3.1
  * - GAUTSCHI
    - 2.0.0, 2.1.0, 2.3.1
  * - NEGISHI
    - 2.0.0, 2.1.0, 2.3.1
  * - SCHOLAR
    - 2.0.0, 2.1.0, 2.3.1

Commands
~~~~~~~
- seqkit

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load seqkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Seqkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=seqkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers seqkit

    seqkit stats configs.fasta > contigs_statistics.txt
.. _Github: https://github.com/shenwei356/seqkit
