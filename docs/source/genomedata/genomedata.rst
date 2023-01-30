.. _backbone-label:

Genomedata
==============================

Introduction
~~~~~~~~
Genomedata is a format for efficient storage of multiple tracks of numeric data anchored to a genome. The format allows fast random access to hundreds of gigabytes of data, while retaining a small disk space footprint.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/genomedata 
| Home page: http://pmgenomics.ca/hoffmanlab/proj/genomedata/

Versions
~~~~~~~~
- 1.5.0

Commands
~~~~~~~
- python
- python3
- genomeCoverageBed
- genomedata-close-data
- genomedata-erase-data
- genomedata-hardmask
- genomedata-histogram
- genomedata-info
- genomedata-load
- genomedata-load-assembly
- genomedata-load-data
- genomedata-load-seq
- genomedata-open-data
- genomedata-query
- genomedata-report

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genomedata

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genomedata on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genomedata
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genomedata
