.. _backbone-label:

Odgi
==============================

Introduction
~~~~~~~~
odgi provides an efficient and succinct dynamic DNA sequence graph model, as well as a host of algorithms that allow the use of such graphs in bioinformatic analyses.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/pangenome/odgi 
| Home page: https://github.com/pangenome/odgi

Versions
~~~~~~~~
- 0.8.3

Commands
~~~~~~~
- odgi

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load odgi

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run odgi on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=odgi
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers odgi
