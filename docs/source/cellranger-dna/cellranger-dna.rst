.. _backbone-label:

Cellranger-dna
==============================

Introduction
~~~~~~~~
Cell Ranger DNA is a set of analysis pipelines that process Chromium single cell DNA sequencing output to align reads, identify copy number variation (CNV), and compare heterogeneity among cells.


| For more information, please check:
| Home page: https://support.10xgenomics.com/single-cell-dna/software/pipelines/latest/what-is-cell-ranger-dna

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- cellranger-dna

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellranger-dna

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellranger-dna on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellranger-dna
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellranger-dna
