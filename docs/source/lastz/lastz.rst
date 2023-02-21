.. _backbone-label:

Lastz
==============================

Introduction
~~~~~~~~
LASTZ - pairwise DNA sequence aligner


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/lastz 
| Home page: https://github.com/lastz/lastz

Versions
~~~~~~~~
- 1.04.15

Commands
~~~~~~~
- lastz
- lastz_32
- lastz_D

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lastz

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lastz on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=lastz
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lastz

    lastz cmc_CFBP8216.fasta cmp_LPPA982.fasta \
         --notransition --step=20 --nogapped \
         --format=maf > cmc_vs_cmp.maf
