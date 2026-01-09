.. _backbone-label:

Sourmash
==============================

Introduction
~~~~~~~~
Sourmash is a tool for quickly search, compare, and analyze genomic and metagenomic data sets.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/sourmash 
| Home page: https://github.com/sourmash-bio/sourmash

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.3.0
- 4.5.0

Commands
~~~~~~~
- sourmash

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sourmash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sourmash on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sourmash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sourmash

