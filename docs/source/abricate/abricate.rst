.. _backbone-label:

Abricate
==============================

Introduction
~~~~~~~~
Abricate is a tool for mass screening of contigs for antimicrobial resistance or virulence genes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/abricate 
| Home page: https://github.com/tseemann/abricate

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.1

Commands
~~~~~~~
- abricate

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load abricate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run abricate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=abricate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers abricate

