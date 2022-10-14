.. _backbone-label:

Ngsutils
==============================

Introduction
~~~~~~~~
``Ngsutils`` is a suite of software tools for working with next-generation sequencing datasets. 

| For more information, please check its website: https://biocontainers.pro/tools/ngsutils and its home page: http://ngsutils.org.

Versions
~~~~~~~~
- 0.5.9

Commands
~~~~~~~
- ngsutils
- bamutils
- bedutils
- fastqutils
- gtfutils

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ngsutils

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Ngsutils on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ngsutils
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ngsutils

    bamutils filter \
        input.bam \
        MQ10filtered.bam  \
        -mapped \
        -noqcfail \
        -gte MAPQ 10

    bamutils stats \
       -gtf genome.gtf MQ10filtered.bam \ 
       > MQ10filtered_bamstats
        
