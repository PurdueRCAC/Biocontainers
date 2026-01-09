.. _backbone-label:

Ldjump
==============================

Introduction
~~~~~~~~
LDJump is an R package to estimate variable recombination rates from population genetic data.


| For more information, please check:
| Home page: https://github.com/PhHermann/LDJump

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.3.1

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ldjump

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ldjump on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ldjump
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ldjump

