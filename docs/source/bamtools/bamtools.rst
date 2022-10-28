.. _backbone-label:

BamTools
==============================

Introduction
~~~~~~~~
``BamTools`` is a programmer API and an end-user toolkit for handling BAM files. This container provides a toolkit-only version (no API to build against). 

| For more information, please check its website: https://biocontainers.pro/tools/bamtools and its home page on `Github`_.

Versions
~~~~~~~~
- 2.5.1

Commands
~~~~~~~
- bamtools

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bamtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run BamTools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH -ddd-error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamtools

    bamtools convert -format fastq -in in.bam -out out.fastq

.. _Github: https://github.com/pezmaster31/bamtools
