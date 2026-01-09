.. _backbone-label:

Pbmm2
==============================

Introduction
~~~~~~~~
Pbmm2 is a minimap2 frontend for PacBio native data formats.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pbmm2 
| Home page: https://github.com/PacificBiosciences/pbmm2

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.7.0

Commands
~~~~~~~
- pbmm2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pbmm2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pbmm2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pbmm2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pbmm2

