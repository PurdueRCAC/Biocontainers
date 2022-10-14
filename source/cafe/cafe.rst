.. _backbone-label:

Cafe
==============================

Introduction
~~~~~~~~
``Cafe`` is a computational tool for the study of gene family evolution. 

| For more information, please check its website: https://biocontainers.pro/tools/cafe and its home page on `Github`_.

Versions
~~~~~~~~
- 4.2.1
- 5.0.0

Commands
~~~~~~~
- cafe

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cafe

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cafe on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cafe
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cafe

    #To get a list of commands just call CAFE with the -h or --help arguments
    cafe5 -h
    
    #To estimate lambda with no among family rate variation issue the command
    cafe5 -i mammal_gene_families.txt -t mammal_tree.txt  
  
.. _Github: https://github.com/hahnlab/CAFE
