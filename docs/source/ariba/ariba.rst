.. _backbone-label:

Ariba
==============================

Introduction
~~~~~~~~
ARIBA is a tool that identifies antibiotic resistance genes by running local assemblies. It can also be used for MLST calling.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/ariba 
| Home page: https://github.com/sanger-pathogens/ariba

Versions
~~~~~~~~
- 2.14.6

Commands
~~~~~~~
- ariba

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ariba

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ariba on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ariba
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ariba
