.. _backbone-label:

Mhm2
==============================

Introduction
~~~~~~~~
MetaHipMer is a de novo metagenome short-read assembler. Version 2 (MHM2) is written entirely in UPC++ and runs efficiently on both single servers and on multinode supercomputers, where it can scale up to coassemble terabase-sized metagenomes.
|For more information, please check:
|Home page: https://bitbucket.org/berkeleylab/mhm2/wiki/Home.md

Versions
~~~~~~~~
- 2.0.0

Commands
~~~~~~~
- mhm2.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mhm2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mhm2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mhm2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mhm2

    mhm2.py -r input_1.fastq,input_2.fastq
