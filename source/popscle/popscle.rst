.. _backbone-label:

Popscle
==============================

Introduction
~~~~~~~~
``Popscle`` is a suite of population scale analysis tools for single-cell genomics data. |For more information, please check its |Docker hub: https://hub.docker.com/r/cumulusprod/popscle and its home page on `Github`_.

Versions
~~~~~~~~
- 0.1b

Commands
~~~~~~~
- popscle

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load popscle

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Popscle on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=popscle
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers popscle

    popscle dsc-pileup --sam data/$bam --vcf data/$ref_vcf --out data/$pileup
.. _Github: https://github.com/statgen/popscle
