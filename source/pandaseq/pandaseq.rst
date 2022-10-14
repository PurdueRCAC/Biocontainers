.. _backbone-label:

Pandaseq
==============================

Introduction
~~~~~~~~
``Pandaseq`` is a program to align Illumina reads, optionally with PCR primers embedded in the sequence, and reconstruct an overlapping sequence. | For more information, please check its | Docker hub: https://hub.docker.com/r/pipecraft/pandaseq and its home page on `Github`_.

Versions
~~~~~~~~
- 2.11

Commands
~~~~~~~
- pandaseq

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pandaseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pandaseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pandaseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pandaseq

    pandaseq -f SRR069027_1.fastq -r SRR069027_2.fastq
.. _Github: https://github.com/neufeld/pandaseq
