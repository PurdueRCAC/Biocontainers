.. _backbone-label:

Annogesic
==============================

Introduction
~~~~~~~~
ANNOgesic is the swiss army knife for RNA-Seq based annotation of bacterial/archaeal genomes.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/silasysh/annogesic 
| Home page: https://github.com/Sung-Huan/ANNOgesic

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- annogesic

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load annogesic

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run annogesic on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=annogesic
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers annogesic

