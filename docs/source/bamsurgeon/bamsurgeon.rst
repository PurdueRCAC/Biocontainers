.. _backbone-label:

Bamsurgeon
==============================

Introduction
~~~~~~~~
Bamsurgeon are tools for adding mutations to .bam files, used for testing mutation callers.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/lethalfang/bamsurgeon 
| Home page: https://github.com/adamewing/bamsurgeon

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2

Commands
~~~~~~~
- addindel.py
- addsnv.py
- addsv.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bamsurgeon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bamsurgeon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamsurgeon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamsurgeon

