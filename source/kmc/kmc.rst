.. _backbone-label:

Kmc
==============================

Introduction
~~~~~~~~
``Kmc`` is a tool for efficient k-mer counting and filtering of reads based on k-mer content. 
| For more information, please check its website: https://biocontainers.pro/tools/kmc and its home page on `Github`_.

Versions
~~~~~~~~
- 3.2.1

Commands
~~~~~~~
- kmc
- kmc_dump
- kmc_tools

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load kmc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Kmc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kmc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kmc

    kmc -k27 seq.fastq 27mers .
.. _Github: https://github.com/refresh-bio/kmc
