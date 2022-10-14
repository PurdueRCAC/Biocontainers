.. _backbone-label:

Fastq_pair
==============================

Introduction
~~~~~~~~
``Fastq_pair`` is used to match up paired end fastq files quickly and efficiently. | For more information, please check its website: https://biocontainers.pro/tools/fastq_pair and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- fastq_pair

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fastq_pair

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Fastq_pair on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastq_pair
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastq_pair

    fastq_pair seq_1.fastq  seq_2.fastq 
.. _Github: https://github.com/linsalrob/fastq-pair
