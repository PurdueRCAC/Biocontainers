.. _backbone-label:

Bactopia
==============================

Introduction
~~~~~~~~
Bactopia is a flexible pipeline for complete analysis of bacterial genomes. The goal of Bactopia is to process your data with a broad set of tools, so that you can get to the fun part of analyses quicker!
For more information, please check:
Docker hub: https://hub.docker.com/r/bactopia/bactopia 
Home page: https://github.com/bactopia/bactopia

Versions
~~~~~~~~
- 2.0.3

Commands
~~~~~~~
- bactopia

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bactopia

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bactopia on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=bactopia
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bactopia
    
    bactopia datasets \
    --ariba "vfdb_core,card" \
    --species "Staphylococcus aureus" \
    --include_genus \
    --limit 100 \
    --cpus 12
    
    bactopia --accession SRX4563634 \
    --datasets datasets/ \
    --species "Staphylococcus aureus" \
    --coverage 100 \
    --genome_size median \
    --outdir ena-single-sample \
    --max_cpus 12
