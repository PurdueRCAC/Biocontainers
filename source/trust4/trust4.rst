.. _backbone-label:

Trust4
==============================

Introduction
~~~~~~~~
Tcr Receptor Utilities for Solid Tissue (TRUST) is a computational tool to analyze TCR and BCR sequences using unselected RNA sequencing data, profiled from solid tissues, including tumors.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/trust4 
Home page: https://github.com/liulab-dfci/TRUST4

Versions
~~~~~~~~
- 1.0.7

Commands
~~~~~~~
- run-trust4
- BuildDatabaseFa.pl
- BuildImgtAnnot.pl
- trust-airr.pl
- trust-barcoderep.pl
- trust-simplerep.pl
- trust-smartseq.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trust4

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run trust4 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trust4
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trust4

    run-trust4 -b mapped.bam -f hg38_bcrtcr.fa --ref human_IMGT+C.fa
