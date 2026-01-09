.. _backbone-label:

Cellrank
==============================

Introduction
~~~~~~~~
Cellrank is a toolkit to uncover cellular dynamics based on Markov state modeling of single-cell data.


| For more information, please check:
| Home page: https://cellrank.readthedocs.io/en/stable/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.5.1

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellrank

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellrank on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellrank
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellrank

