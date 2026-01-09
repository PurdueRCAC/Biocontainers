.. _backbone-label:

Recycler
==============================

Introduction
~~~~~~~~
Recycler is a tool designed for extracting circular sequences from de novo assembly graphs.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/recycler 
| Home page: https://github.com/Shamir-Lab/Recycler

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.7

Commands
~~~~~~~
- make_fasta_from_fastg.py
- get_simple_cycs.py
- recycle.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load recycler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run recycler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=recycler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers recycler

