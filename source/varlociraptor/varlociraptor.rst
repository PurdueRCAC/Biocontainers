.. _backbone-label:

Varlociraptor
==============================

Introduction
~~~~~~~~
``Varlociraptor`` implements a novel, unified fully uncertainty-aware approach to genomic variant calling in arbitrary scenarios. 

| For more information, please check its website: https://biocontainers.pro/tools/varlociraptor and its home page on `Github`_.

Versions
~~~~~~~~
- 4.11.4

Commands
~~~~~~~
- varlociraptor

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load varlociraptor

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Varlociraptor on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=varlociraptor
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers varlociraptor

    varlociraptor call variants tumor-normal --purity 0.75 --tumor
.. _Github: https://github.com/varlociraptor/varlociraptor
