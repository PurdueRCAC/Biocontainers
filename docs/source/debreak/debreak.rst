.. _backbone-label:

Debreak
==============================

Introduction
~~~~~~~~
Debreak is a SV caller for long-read single-molecular sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/debreak 
| Home page: https://github.com/ChongLab/DeBreak

Versions
~~~~~~~~
- 1.3

Commands
~~~~~~~
- debreak

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load debreak

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run debreak on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=debreak
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers debreak
