.. _backbone-label:

Bamtools
==============================

Introduction
~~~~~~~~
BamTools is a programmer API and an end-user toolkit for handling BAM files. This container provides a toolkit-only version (no API to build against).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bamtools 
| Home page: https://github.com/pezmaster31/bamtools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.5.1

Commands
~~~~~~~
- bamtools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bamtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bamtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamtools

