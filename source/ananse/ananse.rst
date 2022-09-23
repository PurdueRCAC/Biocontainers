.. _backbone-label:

Ananse
==============================

Introduction
~~~~~~~~
ANANSE is a computational approach to infer enhancer-based gene regulatory networks (GRNs) and to identify key transcription factors between two GRNs.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/ananse 
Home page: https://github.com/vanheeringen-lab/ANANSE

Versions
~~~~~~~~
- 0.4.0

Commands
~~~~~~~
- ananse

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ananse

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ananse on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ananse
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ananse
