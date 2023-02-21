.. _backbone-label:

Clonalframeml
==============================

Introduction
~~~~~~~~
ClonalFrameML is a software package that performs efficient inference of recombination in bacterial genomes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/clonalframeml 
| Home page: https://github.com/xavierdidelot/ClonalFrameML

Versions
~~~~~~~~
- 1.11

Commands
~~~~~~~
- ClonalFrameML

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clonalframeml

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clonalframeml on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clonalframeml
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clonalframeml
