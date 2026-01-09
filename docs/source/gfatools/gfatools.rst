.. _backbone-label:

Gfatools
==============================

Introduction
~~~~~~~~
gfatools is a set of tools for manipulating sequence graphs in the GFA or the rGFA format. It has implemented parsing, subgraph and conversion to FASTA/BED.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gfatools 
| Home page: https://github.com/lh3/gfatools

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.5

Commands
~~~~~~~
- gfatools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gfatools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gfatools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gfatools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gfatools

