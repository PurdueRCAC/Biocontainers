.. _backbone-label:

Reapr
==============================

Introduction
~~~~~~~~
Reapr is a tool that evaluates the accuracy of a genome assembly using mapped paired end reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/reapr 
| Home page: https://www.sanger.ac.uk/tool/reapr/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.18

Commands
~~~~~~~
- reapr

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load reapr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run reapr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=reapr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers reapr

