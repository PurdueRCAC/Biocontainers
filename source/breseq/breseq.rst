.. _backbone-label:

Breseq
==============================

Introduction
~~~~~~~~
``Breseq`` is a computational pipeline for the analysis of short-read re-sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/breseq and its home page on `Github`_.

Versions
~~~~~~~~
- 0.36.1

Commands
~~~~~~~
- breseq

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load breseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Breseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=breseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers breseq

.. _Github: https://github.com/barricklab/breseq
