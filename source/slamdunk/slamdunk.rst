.. _backbone-label:

Slamdunk
==============================

Introduction
~~~~~~~~
Slamdunk is a novel, fully automated software tool for automated, robust, scalable and reproducible SLAMseq data analysis.
For more information, please check:
Docker hub: https://hub.docker.com/r/tobneu/slamdunk 
Home page: http://t-neumann.github.io/slamdunk/

Versions
~~~~~~~~
- 0.4.3

Commands
~~~~~~~
- slamdunk
- alleyoop

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load slamdunk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run slamdunk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=slamdunk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers slamdunk
