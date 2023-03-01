.. _backbone-label:

Abpoa
==============================

Introduction
~~~~~~~~
abPOA: adaptive banded Partial Order Alignment


| For more information, please check:
| Home page: https://github.com/yangao07/abPOA

Versions
~~~~~~~~
- 1.4.1

Commands
~~~~~~~
- abpoa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load abpoa

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abpoa on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=abpoa
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abpoa
   
    abpoa seq.fa > cons.fa
