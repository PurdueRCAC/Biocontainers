.. _backbone-label:

Gapit
==============================

Introduction
~~~~~~~~
GAPIT is a Genome Association and Prediction Integrated Tool.


| For more information, please check:
| Home page: https://www.maizegenetics.net/gapit

Versions
~~~~~~~~
- 3.3

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gapit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gapit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gapit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gapit
