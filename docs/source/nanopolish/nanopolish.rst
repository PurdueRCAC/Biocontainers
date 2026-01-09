.. _backbone-label:

Nanopolish
==============================

Introduction
~~~~~~~~
Nanopolish is a software package for signal-level analysis of Oxford Nanopore sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/nanopolish 
| Home page: https://github.com/jts/nanopolish

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.13.2
- 0.14.0

Commands
~~~~~~~
- nanopolish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load nanopolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run nanopolish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nanopolish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanopolish

