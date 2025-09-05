.. _backbone-label:

Seacr
==============================

Introduction
~~~~~~~~
SEACR is intended to call peaks and enriched regions from sparse CUT&RUN or chromatin profiling data in which background is dominated by "zeroes" (i.e. regions with no read coverage).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/seacr 
| Home page: https://github.com/FredHutch/SEACR

Versions
~~~~~~~~
- 1.3

Commands
~~~~~~~
- SEACR_1.3.sh

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load seacr

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run seacr on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=seacr
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers seacr
