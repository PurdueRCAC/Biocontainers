.. _backbone-label:

Bamscale
==============================

Introduction
~~~~~~~~
BAMscale is a one-step tool to 1) quantify/normalize peak coverages from multiple BAM files 2) create scaled BigWig files for easy visualization. BAMscale can quantify peaks in BED format from one or multiple BAM files. The output files are raw read counts, as well as FPKM, library-size and TPM normalized peak-scores (one file for each).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bamscale 
| Home page: https://github.com/ncbi/BAMscale

Versions
~~~~~~~~
- 0.0.5

Commands
~~~~~~~
- BAMscale

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bamscale

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bamscale on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamscale
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamscale
