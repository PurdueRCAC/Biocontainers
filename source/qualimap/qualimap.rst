.. _backbone-label:

Qualimap
==============================

Introduction
~~~~~~~~
``Qualimap`` is a platform-independent application written in Java and R that provides both a Graphical User Inteface (GUI) and a command-line interface to facilitate the quality control of alignment sequencing data and its derivatives like feature counts. |For more information, please check its website: https://biocontainers.pro/tools/qualimap and its home page: http://qualimap.conesalab.org.

Versions
~~~~~~~~
- 2.2.1

Commands
~~~~~~~
- qualimap

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load qualimap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Qualimap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=qualimap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers qualimap
