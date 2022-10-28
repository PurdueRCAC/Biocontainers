.. _backbone-label:

Trimmomatic
==============================

Introduction
~~~~~~~~
``Trimmomatic`` is a flexible read trimming tool for Illumina NGS data. 

| For more information, please check its website: https://biocontainers.pro/tools/trimmomatic and its home page: http://www.usadellab.org/cms/index.php?page=trimmomatic.

Versions
~~~~~~~~
- 0.39

Commands
~~~~~~~
- trimmomatic

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trimmomatic

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Trimmomatic on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=trimmomatic
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trimmomatic

    trimmomatic PE -threads 8 \
        input_forward.fq.gz input_reverse.fq.gz \ 
        output_forward_paired.fq.gz output_forward_unpaired.fq.gz \
        output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz \
        ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
