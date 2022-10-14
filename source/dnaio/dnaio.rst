.. _backbone-label:

Dnaio
==============================

Introduction
~~~~~~~~
``Dnaio`` is a Python 3.7+ library for very efficient parsing and writing of FASTQ and also FASTA files. 
| For more information, please check its website: https://biocontainers.pro/tools/dnaio and its home page on `Github`_.

Versions
~~~~~~~~
- 0.8.1-py37

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load dnaio

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Dnaio on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=dnaio
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dnaio

    python dnaio_test.py

.. _Github: https://github.com/marcelm/dnaio
