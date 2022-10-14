.. _backbone-label:

Cellphonedb
==============================

Introduction
~~~~~~~~
CellPhoneDB is a publicly available repository of curated receptors, ligands and their interactions.

| For more information, please check:
| Docker hub: https://hub.docker.com/r/eagleshot/cellphonedb 
| Home page: https://github.com/Teichlab/cellphonedb

Versions
~~~~~~~~
- 2.1.7

Commands
~~~~~~~
- cellphonedb

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellphonedb

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellphonedb on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellphonedb
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellphonedb
