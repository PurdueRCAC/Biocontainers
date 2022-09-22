.. _backbone-label:

Miniasm
==============================

Introduction
~~~~~~~~
``Miniasm`` is a very fast OLC-based de novo assembler for noisy long reads. For more information, please check its website: https://biocontainers.pro/tools/miniasm and its home page on `Github`_.

Versions
~~~~~~~~
- 0.3_r179

Commands
~~~~~~~
- miniasm
- minidot

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load miniasm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Miniasm on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=miniasm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers miniasm

    miniasm -f Elysia_ont_test.fq  Elysia_reads.paf.gz \
         > Elysia_reads.gfa
.. _Github:  https://github.com/lh3/miniasm
