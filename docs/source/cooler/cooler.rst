.. _backbone-label:

Cooler
==============================

Introduction
~~~~~~~~
Cooler is a support library for a sparse, compressed, binary persistent storage format, also called cooler, used to store genomic interaction data, such as Hi-C contact matrices.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cooler 
| Home page: https://github.com/open2c/cooler

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.8.11

Commands
~~~~~~~
- cooler
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cooler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cooler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cooler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cooler

