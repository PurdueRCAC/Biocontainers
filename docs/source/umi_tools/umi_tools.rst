.. _backbone-label:

Umi_tools
==============================

Introduction
~~~~~~~~
Umi_tools is a collection of tools for handling Unique Molecular Identifiers in NGS data sets.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/umi_tools 
| Home page: https://github.com/CGATOxford/UMI-tools

Versions
~~~~~~~~
- 1.1.4

Commands
~~~~~~~
- umi_tools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load umi_tools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run umi_tools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=umi_tools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers umi_tools
