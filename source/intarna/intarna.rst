.. _backbone-label:

Intarna
==============================

Introduction
~~~~~~~~
``Intarna`` is a general and fast approach to the prediction of RNA-RNA interactions incorporating both the accessibility of interacting sites as well as the existence of a user-definable seed interaction. 

| For more information, please check its website: https://biocontainers.pro/tools/intarna and its home page on `Github`_.

Versions
~~~~~~~~
- 3.3.1

Commands
~~~~~~~
- IntaRNA

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load intarna

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Intarna on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=intarna
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers intarna

    IntaRNA -t CCCCCCCCGGGGGGGGGGGGGG -q AAAACCCCCCCUUUU

.. _Github: https://github.com/BackofenLab/IntaRNA#usage
