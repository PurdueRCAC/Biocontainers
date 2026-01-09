.. _backbone-label:

Lambda
==============================

Introduction
~~~~~~~~
Lambda is a local aligner optimized for many query sequences and searches in protein space.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/lambda 
| Home page: http://seqan.github.io/lambda/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.0.0

Commands
~~~~~~~
- lambda2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lambda

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lambda on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=lambda
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lambda

