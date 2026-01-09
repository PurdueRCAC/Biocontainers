.. _backbone-label:

Roary
==============================

Introduction
~~~~~~~~
Roary is a high speed stand alone pan genome pipeline, which takes annotated assemblies in GFF3 format (produced by Prokka) and calculates the pan genome.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/roary 
| Home page: https://github.com/sanger-pathogens/Roary

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 3.13.0

Commands
~~~~~~~
- roary

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load roary

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run roary on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=roary
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers roary

