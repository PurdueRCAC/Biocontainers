.. _backbone-label:

Trimal
==============================

Introduction
~~~~~~~~
``Trimal`` is a tool for the automated removal of spurious sequences or poorly aligned regions from a multiple sequence alignment. |For more information, please check its website: https://biocontainers.pro/tools/trimal and its home page: http://trimal.cgenomics.org.

Versions
~~~~~~~~
- 1.4.1

Commands
~~~~~~~
- trimal
- readal
- statal

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trimal

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Trimal on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trimal
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trimal

    trimal -in input.fasta -out output1 -htmlout output1.html -gt 1
