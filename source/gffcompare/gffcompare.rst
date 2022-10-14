.. _backbone-label:

Gffcompare
==============================

Introduction
~~~~~~~~
``Gffcompare`` is used to compare, merge, annotate and estimate accuracy of one or more GFF files. 

| For more information, please check its website: https://biocontainers.pro/tools/gffcompare and its home page: https://ccb.jhu.edu/software/stringtie/gffcompare.shtml.

Versions
~~~~~~~~
- 0.11.2

Commands
~~~~~~~
- gffcompare

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gffcompare

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Gffcompare on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gffcompare
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gffcompare

    gffcompare -r annotation.gff transcripts.gtf
