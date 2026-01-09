.. _backbone-label:

Ismapper
==============================

Introduction
~~~~~~~~
ISMapper searches for IS positions in sequence data using paired end Illumina short reads, an IS query/queries of interest and a reference genome. ISMapper reports the IS positions it has found in each isolate, relative to the provided reference genome.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ismapper 
| Home page: https://github.com/jhawkey/IS_mapper

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.0.2

Commands
~~~~~~~
- ismap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ismapper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ismapper on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ismapper
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ismapper

