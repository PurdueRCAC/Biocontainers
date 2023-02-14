.. _backbone-label:

Kakscalculator2
==============================

Introduction
~~~~~~~~
kakscalculator2 is a toolkit of incorporating gamma series methods and sliding window strategies.


| For more information, please check:
| Home page: https://github.com/kullrich/kakscalculator2

Versions
~~~~~~~~
- 2.0.1

Commands
~~~~~~~
- KaKs_Calculator

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kakscalculator2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kakscalculator2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kakscalculator2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kakscalculator2
