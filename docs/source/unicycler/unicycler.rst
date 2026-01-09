.. _backbone-label:

Unicycler
==============================

Introduction
~~~~~~~~
Unicycler is an assembly pipeline for bacterial genomes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/unicycler 
| Home page: https://github.com/rrwick/Unicycler

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.5.0

Commands
~~~~~~~
- unicycler

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load unicycler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run unicycler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=unicycler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers unicycler

