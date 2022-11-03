.. _backbone-label:

Phipack
==============================

Introduction
~~~~~~~~
PhiPack: PHI test and other tests of recombination


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/phipack 
| Home page: http://www.maths.otago.ac.nz/~dbryant/software.html

Versions
~~~~~~~~
- 1.1

Commands
~~~~~~~
- Phi
- Profile

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phipack

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phipack on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phipack
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phipack
