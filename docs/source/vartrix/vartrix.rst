.. _backbone-label:

Vartrix
==============================

Introduction
~~~~~~~~
Vartrix is a software tool for extracting single cell variant information from 10x Genomics single cell data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/vartrix 
| Home page: https://github.com/10XGenomics/vartrix

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.22

Commands
~~~~~~~
- vartrix

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vartrix

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vartrix on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vartrix
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vartrix

