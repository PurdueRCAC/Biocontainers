.. _backbone-label:

Circexplorer2
==============================

Introduction
~~~~~~~~
CIRCexplorer2 is a comprehensive and integrative circular RNA analysis toolset. It is the successor of CIRCexplorer with plenty of new features to facilitate circular RNA identification and characterization.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/circexplorer2 
Home page: https://github.com/YangLab/CIRCexplorer2

Versions
~~~~~~~~
- 2.3.8

Commands
~~~~~~~
- CIRCexplorer2
- fast_circ.py
- fetch_ucsc.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load circexplorer2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run circexplorer2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=circexplorer2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers circexplorer2
