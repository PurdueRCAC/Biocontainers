.. _backbone-label:

Checkm-genome
==============================

Introduction
~~~~~~~~
CheckM provides a set of tools for assessing the quality of genomes recovered from isolates, single cells, or metagenomes.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/checkm-genome 
Home page: https://github.com/Ecogenomics/CheckM

Versions
~~~~~~~~
- 1.2.0

Commands
~~~~~~~
- checkm-genome

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
    #SBATCH -n 8
    #SBATCH --job-name=checkm-genome
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers checkm-genome

    checkm lineage_wf -t 8 -x fa bins checkm
