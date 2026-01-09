.. _backbone-label:

Pysam
==============================

Introduction
~~~~~~~~
Pysam is a python module that makes it easy to read and manipulate mapped short read sequence data stored in SAM/BAM files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pysam 
| Home page: https://github.com/pysam-developers/pysam

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.18.0

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pysam

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pysam on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pysam
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pysam

