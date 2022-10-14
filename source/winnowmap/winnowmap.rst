.. _backbone-label:

Winnowmap
==============================

Introduction
~~~~~~~~
Winnowmap is a long-read mapping algorithm optimized for mapping ONT and PacBio reads to repetitive reference sequences.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/winnowmap 
|Home page: https://github.com/marbl/Winnowmap

Versions
~~~~~~~~
- 2.03

Commands
~~~~~~~
- winnowmap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load winnowmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run winnowmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=winnowmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers winnowmap

    winnowmap -W repetitive_k15.txt \
        -ax map-pb Cm.contigs.fasta \
        SRR3982487.fastq > output.sam
