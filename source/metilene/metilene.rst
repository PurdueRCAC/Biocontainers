.. _backbone-label:

Metilene
==============================

Introduction
~~~~~~~~
Metilene is a versatile tool to study the effect of epigenetic modifications in differentiation/development, tumorigenesis, and systems biology on a global, genome-wide level.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/metilene 
|Home page: https://www.bioinf.uni-leipzig.de/Software/metilene/

Versions
~~~~~~~~
- 0.2.8

Commands
~~~~~~~
- metilene
- metilene_input.pl
- metilene_output.pl
- metilene_output.R

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load metilene

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run metilene on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=metilene
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers metilene

    metilene -a g1 -b g2 methylation-file
