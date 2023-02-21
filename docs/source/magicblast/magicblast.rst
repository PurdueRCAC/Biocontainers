.. _backbone-label:

Magicblast
==============================

Introduction
~~~~~~~~
Magic-BLAST is a tool for mapping large next-generation RNA or DNA sequencing runs against a whole genome or transcriptome. Each alignment optimizes a composite score, taking into account simultaneously the two reads of a pair, and in case of RNA-seq, locating the candidate introns and adding up the score of all exons. This is very different from other versions of BLAST, where each exon is scored as a separate hit and read-pairing is ignored.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/ncbi/magicblast 
| Home page: https://ncbi.github.io/magicblast/

Versions
~~~~~~~~
- 1.5.0

Commands
~~~~~~~
- magicblast

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load magicblast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run magicblast on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=magicblast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers magicblast
