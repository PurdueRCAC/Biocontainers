.. _backbone-label:

Pyfaidx
==============================

Introduction
~~~~~~~~
``Pyfaidx`` is a Python package for random access and indexing of fasta files. 

| For more information, please check its website: https://biocontainers.pro/tools/pyfaidx and its home page on `Github`_.

Versions
~~~~~~~~
- 0.6.4

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pyfaidx

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pyfaidx on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pyfaidx
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pyfaidx

.. _Github: https://github.com/mdshw5/pyfaidx
