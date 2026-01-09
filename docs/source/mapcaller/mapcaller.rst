.. _backbone-label:

Mapcaller
==============================

Introduction
~~~~~~~~
Mapcaller is an efficient and versatile approach for short-read mapping and variant identification using high-throughput sequenced data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mapcaller 
| Home page: https://github.com/hsinnan75/MapCaller

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.9.9.41

Commands
~~~~~~~
- MapCaller

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mapcaller

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mapcaller on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mapcaller
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mapcaller

