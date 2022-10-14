.. _backbone-label:

CIRIquant
==============================

Introduction
~~~~~~~~
``CIRIquant`` is a comprehensive analysis pipeline for circRNA detection and quantification in RNA-Seq data. |For more information, please check its |Docker hub: https://hub.docker.com/r/mortreux/ciriquant and its home page on `Github`_.

Versions
~~~~~~~~
- 1.1.2

Commands
~~~~~~~
- CIRIquant

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ciriquant

config.yml 
~~~~
All required dependencies have been installed within the CIRIquant container image. But users still need toprovide the PATH of these exectuables in `config.yml`. Please use the below `config.yml` as example::

    name: hg38
    tools:
       bwa: /bin/bwa
       hisat2: /bin/hisat2
       stringtie: /bin/stringtie
       samtools: /usr/local/bin/samtools
    reference:
       fasta: reference/Homo_sapiens.GRCh38.dna.primary_assembly.fa
       gtf:  reference/Homo_sapiens.GRCh38.105.gtf
       bwa_index: reference/Homo_sapiens.GRCh38.dna.primary_assembly.fa
       hisat_index: reference/hg38_hisat2
    

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run CIRIquant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 64
    #SBATCH --job-name=ciriquant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ciriquant

    CIRIquant -t 64 -1 SRR12095148_1.fastq -2 SRR12095148_2.fastq --config config.yml -o Output -p test

.. _Github: https://github.com/bioinfo-biols/CIRIquant
