.. _backbone-label:

How_are_we_stranded_here
==============================

Introduction
~~~~~~~~
``How_are_we_stranded_here`` is a python package for testing strandedness of RNA-Seq fastq files. 

| For more information, please check its website: https://biocontainers.pro/tools/how_are_we_stranded_here and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.1

Commands
~~~~~~~
- check_strandedness

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load how_are_we_stranded_here

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run How_are_we_stranded_here on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=how_are_we_stranded_here
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers how_are_we_stranded_here

    check_strandedness --gtf Homo_sapiens.GRCh38.105.gtf \ 
        --transcripts Homo_sapiens.GRCh38.cds.all.fa \
        --reads_1 seq_1.fastq  --reads_2 seq_2.fastq

.. _Github: https://github.com/betsig/how_are_we_stranded_here
