.. _backbone-label:

Gfaffix
==============================

Introduction
~~~~~~~~
GFAffix identifies walk-preserving shared affixes in variation graphs and collapses them into a non-redundant graph structure.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gfaffix 
| Home page: https://github.com/marschall-lab/GFAffix

Versions
~~~~~~~~
- 0.1.4

Commands
~~~~~~~
- gfaffix

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gfaffix

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gfaffix on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gfaffix
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gfaffix
