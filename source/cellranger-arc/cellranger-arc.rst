.. _backbone-label:

Cellranger-arc
==============================

Introduction
~~~~~~~~
Cell Ranger ARC is a set of analysis pipelines that process Chromium Single Cell Multiome ATAC + Gene Expression sequencing data to generate a variety of analyses pertaining to gene expression (GEX), chromatin accessibility, and their linkage. Furthermore, since the ATAC and GEX measurements are on the very same cell, we are able to perform analyses that link chromatin accessibility and GEX.
For more information, please check:
Docker hub: https://hub.docker.com/r/cumulusprod/cellranger-arc 
Home page: https://support.10xgenomics.com/single-cell-multiome-atac-gex/software/pipelines/latest/what-is-cell-ranger-arc

Versions
~~~~~~~~
- 2.0.2

Commands
~~~~~~~
- cellranger-arc

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellranger-arc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellranger-arc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellranger-arc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellranger-arc
