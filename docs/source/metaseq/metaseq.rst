.. _backbone-label:

Metaseq
==============================

Introduction
~~~~~~~~
Metaseq is a Python package for integrative genome-wide analysis reveals relationships between chromatin insulators and associated nuclear mRNA.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/vsmalladi/metaseq 
| Home page: https://github.com/daler/metaseq

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.5.6

Commands
~~~~~~~
- python
- python2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load metaseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run metaseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=metaseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers metaseq

