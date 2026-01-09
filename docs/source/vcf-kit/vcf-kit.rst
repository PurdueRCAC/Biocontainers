.. _backbone-label:

Vcf-kit
==============================

Introduction
~~~~~~~~
VCF-kit is a command-line based collection of utilities for performing analysis on Variant Call Format (VCF) files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/vcf-kit 
| Home page: https://github.com/AndersenLab/VCF-kit

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.2.6
- 0.2.9

Commands
~~~~~~~
- vk

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vcf-kit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vcf-kit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vcf-kit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vcf-kit

