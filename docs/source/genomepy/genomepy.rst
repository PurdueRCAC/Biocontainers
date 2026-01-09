.. _backbone-label:

Genomepy
==============================

Introduction
~~~~~~~~
Genomepy is designed to provide a simple and straightforward way to download and use genomic data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/genomepy 
| Home page: https://github.com/vanheeringen-lab/genomepy

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.12.0
- 0.14.0

Commands
~~~~~~~
- genomepy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genomepy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genomepy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genomepy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genomepy

