.. _backbone-label:

Pixy
==============================

Introduction
~~~~~~~~
pixy is a command-line tool for painlessly estimating average nucleotide diversity within (π) and between (dxy) populations from a VCF.


| For more information, please check:
| Home page: https://github.com/ksamuk/pixy

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2.7

Commands
~~~~~~~
- pixy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pixy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pixy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pixy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pixy

