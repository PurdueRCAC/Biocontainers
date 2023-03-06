.. _backbone-label:

Cramino
==============================

Introduction
~~~~~~~~
Cramino is a tool for quick quality assessment of cram and bam files, intended for long read sequencing.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/alexanrna/cramino 
| Home page: https://github.com/wdecoster/cramino

Versions
~~~~~~~~
- 0.9.6

Commands
~~~~~~~
- cramino

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cramino

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cramino on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cramino
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cramino
