.. _backbone-label:

Shasta
==============================

Introduction
~~~~~~~~
Shasta is a software for de novo assembly from Oxford Nanopore reads.
| For more information, please check:
| Home page: https://github.com/chanzuckerberg/shasta

Versions
~~~~~~~~
- 0.10.0

Commands
~~~~~~~
- shasta

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shasta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shasta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shasta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shasta

    shasta --input r94_ec_rad2.181119.60x-10kb.fasta \
        --config Nanopore-May2022
