.. _backbone-label:

Ciriquant
==============================

Introduction
~~~~~~~~
CIRIquant is a comprehensive analysis pipeline for circRNA detection and quantification in RNA-Seq data.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/mortreux/ciriquant 
| Home page: https://github.com/bioinfo-biols/CIRIquant

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.2

Commands
~~~~~~~
- CIRIquant

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ciriquant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ciriquant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ciriquant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ciriquant

