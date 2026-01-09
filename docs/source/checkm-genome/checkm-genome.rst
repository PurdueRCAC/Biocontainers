.. _backbone-label:

Checkm-genome
==============================

Introduction
~~~~~~~~
CheckM provides a set of tools for assessing the quality of genomes recovered from isolates, single cells, or metagenomes.


| For more information, please check:
| Home page: https://github.com/Ecogenomics/CheckM

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.2.0
- 1.2.2

Commands
~~~~~~~
- checkm

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load checkm-genome

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run checkm-genome on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=checkm-genome
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers checkm-genome

