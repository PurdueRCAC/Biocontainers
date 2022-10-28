.. _backbone-label:

Panacota
==============================

Introduction
~~~~~~~~
``Panacota`` is a software providing tools for large scale bacterial comparative genomics. 

| For more information, please check its website: https://biocontainers.pro/tools/panacota and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3.1

Commands
~~~~~~~
- PanACoTA

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load panacota

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Panacota on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=panacota
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers panacota

    PanACoTA annotate \
        -d Examples/genomes_init \
        -l Examples/input_files/list_genomes.lst \
        -r Examples/2-res-QC -Q
.. _Github: https://github.com/gem-pasteur/PanACoTA
