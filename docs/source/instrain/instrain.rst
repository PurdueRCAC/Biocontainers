.. _backbone-label:

Instrain
==============================

Introduction
~~~~~~~~
Instrain is a python program for analysis of co-occurring genome populations from metagenomes that allows highly accurate genome comparisons, analysis of coverage, microdiversity, and linkage, and sensitive SNP detection with gene localization and synonymous non-synonymous identification.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/instrain 
| Home page: https://github.com/MrOlm/inStrain

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.5.7
- 1.6.3

Commands
~~~~~~~
- inStrain

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load instrain

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run instrain on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=instrain
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers instrain

