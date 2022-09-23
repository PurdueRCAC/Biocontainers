.. _backbone-label:

Bioconvert
==============================

Introduction
~~~~~~~~
``Bioconvert`` is a collaborative project to facilitate the interconversion of life science data from one format to another. For more information, please check its website: https://biocontainers.pro/tools/bioconvert and its home page: https://bioconvert.readthedocs.io/en/master/.

Versions
~~~~~~~~
- 0.4.3
- 0.5.2
- 0.6.1

Commands
~~~~~~~
- bioconvert

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bioconvert

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bioconvert on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bioconvert
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bioconvert

    bioconvert fastq2fasta input.fastq output.fa
