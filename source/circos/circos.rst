.. _backbone-label:

Circos
==============================

Introduction
~~~~~~~~
``Circos`` is a software package for visualizing data and information. 

| For more information, please check its website: https://biocontainers.pro/tools/circos and its home page: http://circos.ca.

Versions
~~~~~~~~
- 0.69.8

Commands
~~~~~~~
- circos

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load circos

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Circos on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=circos
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers circos
    
    circos -conf circos.conf
