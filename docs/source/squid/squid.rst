.. _backbone-label:

Squid
==============================

Introduction
~~~~~~~~
SQUID is designed to detect both fusion-gene and non-fusion-gene transcriptomic structural variations from RNA-seq alignment.


| For more information, please check:
| Home page: https://github.com/Kingsford-Group/squid

Versions
~~~~~~~~
- 1.5

Commands
~~~~~~~
- squid
- AnnotateSQUIDOutput.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load squid

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run squid on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=squid
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers squid
