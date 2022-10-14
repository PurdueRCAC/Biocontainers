.. _backbone-label:

Blasr
==============================

Introduction
~~~~~~~~
``Blasr`` Blasr is a read mapping program that maps reads to positions in a genome by clustering short exact matches between the read and the genome, and scoring clusters using alignment. | For more information, please check its website: https://biocontainers.pro/tools/blasr and its home page on `Github`_.

Versions
~~~~~~~~
- 5.3.5

Commands
~~~~~~~
- blasr

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load blasr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Blasr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=blasr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers blasr

    blasr reads.bas.h5  ecoli_K12.fasta -sam

.. _Github: https://github.com/PacificBiosciences/blasr
