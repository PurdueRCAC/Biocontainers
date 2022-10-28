.. _backbone-label:

Snaptools
==============================

Introduction
~~~~~~~~
``Snaptools`` is a python module for pre-processing and working with snap file. 

| For more information, please check its website: https://biocontainers.pro/tools/snaptools and its home page on `Github`_.

Versions
~~~~~~~~
- 1.4.8

Commands
~~~~~~~
- snaptools

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snaptools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Snaptools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snaptools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snaptools

.. _Github: https://github.com/r3fang/SnapTools
