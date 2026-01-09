.. _backbone-label:

Snakemake
==============================

Introduction
~~~~~~~~
Snakemake is a workflow engine that provides a readable Python-based workflow definition language and a powerful execution environment that scales from single-core workstations to compute clusters without modifying the workflow.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/snakemake 
| Home page: https://snakemake.readthedocs.io/en/stable/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 6.8.0

Commands
~~~~~~~
- snakemake

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load snakemake

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run snakemake on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snakemake
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snakemake

