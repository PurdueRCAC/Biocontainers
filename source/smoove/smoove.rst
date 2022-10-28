.. _backbone-label:

Smoove
==============================

Introduction
~~~~~~~~
``Smoove`` simplifies and speeds calling and genotyping SVs for short reads. 

| For more information, please check its website: https://biocontainers.pro/tools/smoove and its home page on `Github`_.

Versions
~~~~~~~~
- 0.2.7

Commands
~~~~~~~
- smoove

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load smoove

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Smoove on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=smoove
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers smoove

    smoove call \
        -x --name my-cohort \
        --exclude hg38_blacklist.bed \
        --fasta  Homo_sapiens.GRCh38.dna.primary_assembly.fa \
         -p 24 \
        --genotype input_bams/*.bam

.. _Github: https://github.com/brentp/smoove
