.. _backbone-label:

Parallel-fastq-dump
==============================

Introduction
~~~~~~~~
``Parallel-fastq-dump`` is the parallel fastq-dump wrapper. 

| For more information, please check its website: https://biocontainers.pro/tools/parallel-fastq-dump and its home page on `Github`_.

Versions
~~~~~~~~
- 0.6.7

Commands
~~~~~~~
- parallel-fastq-dump

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load parallel-fastq-dump

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Parallel-fastq-dump on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=parallel-fastq-dump
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers parallel-fastq-dump

    parallel-fastq-dump -s SRR11941281/SRR11941281.sra \ 
        --split-files --threads 4 --gzip 
.. _Github: https://github.com/rvalieris/parallel-fastq-dump
