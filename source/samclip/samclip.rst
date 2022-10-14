.. _backbone-label:

Samclip
==============================

Introduction
~~~~~~~~
Samclip is a tool to filter SAM file for soft and hard clipped alignments.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/samclip 
|Home page: https://github.com/tseemann/samclip

Versions
~~~~~~~~
- 0.4.0

Commands
~~~~~~~
- samclip

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load samclip

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run samclip on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=samclip
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers samclip

    samclip --ref test.fna < test.sam > out.sam
