.. _backbone-label:

Methyldackel
==============================

Introduction
~~~~~~~~
MethylDackel (formerly named PileOMeth, which was a temporary name derived due to it using a PILEup to extract METHylation metrics) will process a coordinate-sorted and indexed BAM or CRAM file containing some form of BS-seq alignments and extract per-base methylation metrics from them. MethylDackel requires an indexed fasta file containing the reference genome as well.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/methyldackel 
Home page: https://github.com/dpryan79/MethylDackel

Versions
~~~~~~~~
- 0.6.1

Commands
~~~~~~~
- MethylDackel

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load methyldackel

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run methyldackel on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=methyldackel
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers methyldackel

    MethylDackel extract chgchh.fa chgchh_aln.bam
