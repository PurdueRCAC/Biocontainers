.. _backbone-label:

Mosdepth
==============================

Introduction
~~~~~~~~
Mosdepth is a new command-line tool for rapidly calculating genome-wide sequencing coverage. It measures depth from BAM or CRAM files at either each nucleotide position in a genome or for sets of genomic regions.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mosdepth 
| Home page: https://github.com/brentp/mosdepth

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 0.3.3

Commands
~~~~~~~
- mosdepth

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mosdepth

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mosdepth on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mosdepth
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mosdepth

