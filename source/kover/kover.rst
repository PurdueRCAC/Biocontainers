.. _backbone-label:

Kover
==============================

Introduction
~~~~~~~~
Kover is an out-of-core implementation of rule-based machine learning algorithms that has been tailored for genomic biomarker discovery.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/aldro61/kover 
| Home page: https://github.com/aldro61/kover

Versions
~~~~~~~~
- 2.0.6

Commands
~~~~~~~
- kover

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kover

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kover on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kover
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kover
