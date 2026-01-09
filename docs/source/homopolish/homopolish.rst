.. _backbone-label:

Homopolish
==============================

Introduction
~~~~~~~~
Homopolish is a genome polisher originally developed for Nanopore and subsequently extended for PacBio CLR. It generates a high-quality genome (>Q50) for virus, bacteria, and fungus. Nanopore/PacBio systematic errors are corrected by retreiving homologs from closely-related genomes and polished by an SVM. When paired with Racon and Medaka, the genome quality can reach Q50-90 (>99.999%) on Nanopore R9.4/10.3 flowcells (Guppy >3.4). For PacBio CLR, Homopolish also improves the majority of Flye-assembled genomes to Q90.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/homopolish 
| Home page: https://github.com/ythuang0522/homopolish

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.4.1

Commands
~~~~~~~
- homopolish

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load homopolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run homopolish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=homopolish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers homopolish

