.. _backbone-label:

Platon
==============================

Introduction
~~~~~~~~
Platon: identification and characterization of bacterial plasmid contigs from short-read draft assemblies.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/platon 
| Home page: https://github.com/oschwengers/platon

Versions
~~~~~~~~
- 1.6

Commands
~~~~~~~
- platon

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load platon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run platon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=platon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers platon
