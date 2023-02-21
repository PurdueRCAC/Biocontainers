.. _backbone-label:

Vcf2tsvpy
==============================

Introduction
~~~~~~~~
Vcf2tsvpy is a small Python program that converts genomic variant data encoded in VCF format into a tab-separated values (TSV) file.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/vcf2tsvpy 
| Home page: https://github.com/sigven/vcf2tsvpy

Versions
~~~~~~~~
- 0.6.0

Commands
~~~~~~~
- vcf2tsvpy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vcf2tsvpy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vcf2tsvpy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vcf2tsvpy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vcf2tsvpy
