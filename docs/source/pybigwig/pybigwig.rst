.. _backbone-label:

Pybigwig
==============================

Introduction
~~~~~~~~
Pybigwig is a python extension, written in C, for quick access to bigBed files and access to and creation of bigWig files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pybigwig 
| Home page: https://github.com/deeptools/pyBigWig

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.3.18

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pybigwig

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pybigwig on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pybigwig
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pybigwig

