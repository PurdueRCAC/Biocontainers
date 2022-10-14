.. _backbone-label:

Bwameth
==============================

Introduction
~~~~~~~~
Bwameth is a tool for fast and accurante alignment of BS-Seq reads.

| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bwameth 
| Home page: https://github.com/brentp/bwa-meth

Versions
~~~~~~~~
- 0.2.5

Commands
~~~~~~~
- bwameth.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bwameth

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bwameth on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bwameth
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bwameth
