.. _backbone-label:

Prodigal
==============================

Introduction
~~~~~~~~
``Prodigal`` is a tool for fast, reliable protein-coding gene prediction for prokaryotic genome. 

| For more information, please check its website: https://biocontainers.pro/tools/prodigal and its home page on `Github`_.

Versions
~~~~~~~~
- 2.6.3

Commands
~~~~~~~
- prodigal

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load prodigal

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Prodigal on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=prodigal
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers prodigal

    prodigal -i genome.fasta -o output.genes -a proteins.faa
.. _Github: https://github.com/hyattpd/Prodigal
