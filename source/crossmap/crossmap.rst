.. _backbone-label:

Crossmap
==============================

Introduction
~~~~~~~~
``Crossmap`` is a program for genome coordinates conversion between different assemblies. 

| For more information, please check its website: https://biocontainers.pro/tools/crossmap and its home page: https://crossmap.readthedocs.io/en/latest/#convert-maf-format-files.

Versions
~~~~~~~~
- 0.6.3

Commands
~~~~~~~
- CrossMap.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load crossmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Crossmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=crossmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers crossmap

    CrossMap.py bed GRCh37_to_GRCh38.chain.gz test.bed
