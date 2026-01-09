.. _backbone-label:

Cross_match
==============================

Introduction
~~~~~~~~
cross_match is a general purpose utility for comparing any two DNA sequence sets using a 'banded' version of swat.


| For more information, please check:
| Home page: http://www.phrap.org/phredphrapconsed.html#block_phrap

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.090518

Commands
~~~~~~~
- cross_match

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cross_match

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cross_match on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cross_match
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cross_match

