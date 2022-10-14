.. _backbone-label:

Pyranges
==============================

Introduction
~~~~~~~~
``Pyranges`` are collections of intervals that support comparison operations (like overlap and intersect) and other methods that are useful for genomic analyses. 
| For more information, please check its website: https://biocontainers.pro/tools/pyranges and its home page on `Github`_.

Versions
~~~~~~~~
- 0.0.115

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pyranges

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pyranges on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pyranges
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pyranges

.. _Github: https://github.com/biocore-ntnu/pyranges
