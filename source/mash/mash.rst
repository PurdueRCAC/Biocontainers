.. _backbone-label:

Mash
==============================

Introduction
~~~~~~~~
``Mash`` is a fast sequence distance estimator that uses MinHash. | For more information, please check its website: https://biocontainers.pro/tools/mash and its home page on `Github`_.

Versions
~~~~~~~~
- 2.3

Commands
~~~~~~~
- mash

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mash on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mash

    mash dist genome1.fasta genome2.fasta
.. _Github: https://github.com/marbl/Mash
