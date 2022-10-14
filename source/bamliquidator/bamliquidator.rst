.. _backbone-label:

Bamliquidator
==============================

Introduction
~~~~~~~~
``Bamliquidator`` is a set of tools for analyzing the density of short DNA sequence read alignments in the BAM file format. |For more information, please check its |Docker hub: https://hub.docker.com/r/bioliquidator/bamliquidator/ and its home page on `Github`_.

Versions
~~~~~~~~
- 1.5.2

Commands
~~~~~~~
- bamliquidator
- bamliquidator_bins
- bamliquidator_regions
- bamliquidatorbatch

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bamliquidator

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bamliquidator on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamliquidator
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamliquidator

.. _Github: https://github.com/BradnerLab/pipeline/wiki/bamliquidator
