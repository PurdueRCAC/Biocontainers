.. _backbone-label:

Simug
==============================

Introduction
~~~~~~~~
``Simug`` is a general-purpose genome simulator. 
| For more information, please check its website: https://biocontainers.pro/tools/simug and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.0

Commands
~~~~~~~
- simuG
- vcf2model

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load simug

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Simug on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=simug
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers simug

.. _Github: https://github.com/yjx1217/simuG
