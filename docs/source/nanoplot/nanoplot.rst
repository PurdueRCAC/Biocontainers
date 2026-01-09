.. _backbone-label:

Nanoplot
==============================

Introduction
~~~~~~~~
Nanoplot is a plotting tool for long read sequencing data and alignments.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/nanoplot 
| Home page: https://github.com/wdecoster/NanoPlot

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.39.0

Commands
~~~~~~~
- NanoPlot

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load nanoplot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run nanoplot on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nanoplot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanoplot

