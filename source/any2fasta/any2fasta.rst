.. _backbone-label:

Any2fasta
==============================

Introduction
~~~~~~~~
Any2fasta can convert various sequence formats to FASTA.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/any2fasta 
Home page: https://github.com/tseemann/any2fasta

Versions
~~~~~~~~
- 0.4.2

Commands
~~~~~~~
- any2fasta

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load any2fasta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run any2fasta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=any2fasta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers any2fasta

    any2fasta input.gff > out.fasta
