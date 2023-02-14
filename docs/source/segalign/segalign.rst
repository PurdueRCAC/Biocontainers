.. _backbone-label:

Segalign
==============================

Introduction
~~~~~~~~
Segalign is a scalable GPU system for pairwise whole genome alignments based on LASTZ's seed-filter-extend paradigm.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/gsneha/segalign 
| Home page: https://github.com/gsneha26/SegAlign

Versions
~~~~~~~~
- 0.1.2

Commands
~~~~~~~
- faToTwoBit
- run_segalign
- run_segalign_repeat_masker
- segalign
- segalign_repeat_masker
- twoBitToFa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load segalign

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run segalign on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=segalign
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers segalign
