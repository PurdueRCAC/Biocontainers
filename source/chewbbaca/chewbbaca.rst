.. _backbone-label:

Chewbbaca
==============================

Introduction
~~~~~~~~
chewBBACA is a comprehensive pipeline including a set of functions for the creation and validation of whole genome and core genome MultiLocus Sequence Typing (wg/cgMLST) schemas, providing an allele calling algorithm based on Blast Score Ratio that can be run in multiprocessor settings and a set of functions to visualize and validate allele variation in the loci. chewBBACA performs the schema creation and allele calls on complete or draft genomes resulting from de novo assemblers.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/chewbbaca 
Home page: https://github.com/B-UMMI/chewBBACA

Versions
~~~~~~~~
- 2.8.5

Commands
~~~~~~~
- chewBBACA.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load chewbbaca

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run chewbbaca on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=chewbbaca
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers chewbbaca
