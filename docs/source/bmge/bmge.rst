.. _backbone-label:

Bmge
==============================

Introduction
~~~~~~~~
Bmge is a program that selects regions in a multiple sequence alignment that are suited for phylogenetic inference.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bmge 
| Home page: https://bioweb.pasteur.fr/packages/pack@BMGE@1.12

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.12

Commands
~~~~~~~
- bmge

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bmge

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bmge on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bmge
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bmge

