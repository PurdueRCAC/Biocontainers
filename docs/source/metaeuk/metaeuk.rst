.. _backbone-label:

Metaeuk
==============================

Introduction
~~~~~~~~
MetaEuk is a modular toolkit designed for large-scale gene discovery and annotation in eukaryotic metagenomic contigs. MetaEuk combines the fast and sensitive homology search capabilities of MMseqs2 with a dynamic programming procedure to recover optimal exons sets. It reduces redundancies in multiple discoveries of the same gene and resolves conflicting gene predictions on the same strand. MetaEuk is GPLv3-licensed open source software that is implemented in C++ and available for Linux and macOS. The software is designed to run efficiently on multiple cores.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/metaeuk 
| Home page: https://github.com/soedinglab/metaeuk

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 6.a5d39d9

Commands
~~~~~~~
- metaeuk

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load metaeuk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run metaeuk on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=metaeuk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers metaeuk

