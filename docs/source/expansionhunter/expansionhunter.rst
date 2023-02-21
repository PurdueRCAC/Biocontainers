.. _backbone-label:

Expansionhunter
==============================

Introduction
~~~~~~~~
Expansion Hunter: a tool for estimating repeat sizes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/expansionhunter 
| Home page: https://github.com/Illumina/ExpansionHunter

Versions
~~~~~~~~
- 4.0.2

Commands
~~~~~~~
- ExpansionHunter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load expansionhunter

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run expansionhunter on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=expansionhunter
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers expansionhunter
