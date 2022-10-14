.. _backbone-label:

Graphmap
==============================

Introduction
~~~~~~~~
``Graphmap`` is a novel mapper targeted at aligning long, error-prone third-generation sequencing data. |For more information, please check its website: https://biocontainers.pro/tools/graphmap and its home page on `Github`_.

Versions
~~~~~~~~
- 0.6.3

Commands
~~~~~~~
- graphmap2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load graphmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Graphmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=graphmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers graphmap

.. _Github: https://github.com/isovic/graphmap
