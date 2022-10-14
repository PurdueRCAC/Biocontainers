.. _backbone-label:

Filtlong
==============================

Introduction
~~~~~~~~
``Filtlong`` is a tool for filtering long reads by quality. It can take a set of long reads and produce a smaller, better subset. It uses both read length (longer is better) and read identity (higher is better) when choosing which reads pass the filter. |For more information, please check its website: https://biocontainers.pro/tools/filtlong and its home page on `Github`_.

Versions
~~~~~~~~
- 0.2.1

Commands
~~~~~~~
- filtlong

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load filtlong

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Filtlong on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=filtlong
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers filtlong

.. _Github: https://github.com/rrwick/Filtlong
