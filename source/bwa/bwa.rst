.. _backbone-label:

BWA
==============================

Introduction
~~~~~~~~
``BWA`` (Burrows-Wheeler Aligner) is a fast, accurate, memory-efficient aligner for short and long sequencing reads. For more information, please check its website: https://biocontainers.pro/tools/bwa and its home page: http://bio-bwa.sourceforge.net.

Versions
~~~~~~~~
- 0.7.17

Commands
~~~~~~~
- bwa
- qualfa2fq.pl
- xa2multi.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bwa

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BWA on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bwa
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bwa

    bwa index ref.fasta
    bwa mem ref.fasta input.fq > test.sam
