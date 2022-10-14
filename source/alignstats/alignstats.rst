.. _backbone-label:

Alignstats
==============================

Introduction
~~~~~~~~
AlignStats produces various alignment, whole genome coverage, and capture coverage metrics for sequence alignment files in SAM, BAM, and CRAM format.
| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/alignstats 
| Home page: https://github.com/jfarek/alignstats

Versions
~~~~~~~~
- 0.9.1

Commands
~~~~~~~
- alignstats

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load alignstats

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run alignstats on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=alignstats
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alignstats

    alignstats -C -i input.bam -o report.txt
