.. _backbone-label:

Nanoplot
==============================

Introduction
~~~~~~~~
``Nanoplot`` is a plotting tool for long read sequencing data and alignments. |For more information, please check its website: https://biocontainers.pro/tools/nanoplot and its home page on `Github`_.

Versions
~~~~~~~~
- 1.39.0

Commands
~~~~~~~
- NanoPlot

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nanoplot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nanoplot on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=nanoplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanoplot

    NanoPlot --summary sequencing_summary.txt --loglength -o summary-plots-log-transformed  
    NanoPlot -t 2 --fastq reads1.fastq.gz reads2.fastq.gz --maxlength 40000 --plots dot --legacy hex
    NanoPlot -t 12 --color yellow --bam alignment1.bam alignment2.bam alignment3.bam --downsample 10000 -o bamplots_downsampled
.. _Github: https://github.com/wdecoster/NanoPlot
