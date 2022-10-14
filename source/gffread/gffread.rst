.. _backbone-label:

Gffread
==============================

Introduction
~~~~~~~~
``Gffread`` is used to validate, filter, convert and perform various other operations on GFF files. | For more information, please check its website: https://biocontainers.pro/tools/gffread and its home page: http://ccb.jhu.edu/software/stringtie/gff.shtml.

Versions
~~~~~~~~
- 0.12.7

Commands
~~~~~~~
- gffread

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gffread

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Gffread on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gffread
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gffread

    gffread -E annotation.gff -o ann_simple.gff

    gffread annotation.gff -T -o annotation.gtf

    gffread -w transcripts.fa -g genome.fa annotation.gff
