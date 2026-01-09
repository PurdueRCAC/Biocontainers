.. _backbone-label:

Nanolyse
==============================

Introduction
~~~~~~~~
Nanolyse is a tool to remove reads mapping to the lambda phage genome from a fastq file.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/nanolyse 
| Home page: https://github.com/wdecoster/nanolyse

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2.0

Commands
~~~~~~~
- NanoLyse

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load nanolyse

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run nanolyse on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nanolyse
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanolyse

