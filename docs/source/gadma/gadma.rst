.. _backbone-label:

Gadma
==============================

Introduction
~~~~~~~~
GADMA is a command-line tool. Basic pipeline presents a series of launches of the genetic algorithm folowed by local search optimization and infers demographic history from the Allele Frequency Spectrum of multiple populations (up to three).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gadma 
| Home page: https://github.com/ctlab/GADMA

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.0.0rc21

Commands
~~~~~~~
- gadma
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gadma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gadma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gadma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gadma

