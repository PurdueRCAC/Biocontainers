.. _backbone-label:

Longphase
==============================

Introduction
~~~~~~~~
LongPhase is an ultra-fast program for simultaneously co-phasing SNPs and SVs by using Nanopore and PacBio long reads. It is capable of producing nearly chromosome-scale haplotype blocks by using Nanpore ultra-long reads without the need for additional trios, chromosome conformation, and strand-seq data. On an 8-core machine, LongPhase can finish phasing a human genome in 10-20 minutes.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/alexanrna/longphase 
| Home page: https://github.com/twolinin/longphase

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.4

Commands
~~~~~~~
- longphase

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load longphase

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run longphase on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=longphase
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers longphase

