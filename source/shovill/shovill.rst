.. _backbone-label:

Shovill
==============================

Introduction
~~~~~~~~
Shovill is a tool to assemble bacterial isolate genomes from Illumina paired-end reads.
For more information, please check:
Docker hub: https://hub.docker.com/r/staphb/shovill 
Home page: https://github.com/tseemann/shovill

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- shovill

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shovill

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shovill on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shovill
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shovill

    shovill --outdir out \
        --R1 test/R1.fq.gz \
        --R2 test/R2.fq.gz
