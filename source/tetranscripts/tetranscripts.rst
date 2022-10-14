.. _backbone-label:

Tetranscripts
==============================

Introduction
~~~~~~~~
``Tetranscripts`` is a package for including transposable elements in differential enrichment analysis of sequencing datasets. 

| For more information, please check its website: https://biocontainers.pro/tools/tetranscripts and its home page on `Github`_.

Versions
~~~~~~~~
- 2.2.1

Commands
~~~~~~~
- TEtranscripts
- TEcount

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load tetranscripts

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Tetranscripts on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tetranscripts
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tetranscripts

    TEtranscripts --format BAM --mode multi \
        -t treatment_sample1.bam treatment_sample2.bam treatment_sample3.bam \
        -c control_sample1.bam control_sample2.bam control_sample3.bam \
        --GTF genic-GTF-file \
        --GTF genic-GTF-file \  
        --project sample_nosort_test
.. _Github: https://github.com/mhammell-laboratory/TEtranscripts
