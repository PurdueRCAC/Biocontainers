.. _backbone-label:

Pullseq
==============================

Introduction
~~~~~~~~
Pullseq is an utility program for extracting sequences from a fasta/fastq file.
| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pullseq 
| Home page: https://github.com/bcthomas/pullseq

Versions
~~~~~~~~
- 1.0.2

Commands
~~~~~~~
- pcre-config
- pcregrep
- pcretest
- pullseq
- seqdiff

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pullseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pullseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pullseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pullseq
