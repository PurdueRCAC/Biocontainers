.. _backbone-label:

Ldhat
==============================

Introduction
~~~~~~~~
LDhat is a package written in the C and C++ languages for the analysis of recombination rates from population genetic data.


| For more information, please check:
| Home page: https://github.com/auton1/LDhat

Versions
~~~~~~~~
- 2.2a

Commands
~~~~~~~
- convert
- pairwise
- interval
- rhomap
- fin

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ldhat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ldhat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ldhat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ldhat
