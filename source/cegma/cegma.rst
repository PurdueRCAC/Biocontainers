.. _backbone-label:

Cegma
==============================

Introduction
~~~~~~~~
CEGMA (Core Eukaryotic Genes Mapping Approach) is a pipeline for building a set of high reliable set of gene annotations in virtually any eukaryotic genome.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/chrishah/cegma 
| Home page: https://github.com/KorfLab/CEGMA_v2

Versions
~~~~~~~~
- 2.5

Commands
~~~~~~~
- cegma

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cegma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cegma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cegma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cegma

    cegma --genome genome.fasta -o output
