.. _backbone-label:

Parsnp
==============================

Introduction
~~~~~~~~
``Parsnp`` is used to align the core genome of hundreds to thousands of bacterial genomes within a few minutes to few hours. 
| For more information, please check its website: https://biocontainers.pro/tools/parsnp and its home page on `Github`_.

Versions
~~~~~~~~
- 1.6.2

Commands
~~~~~~~
- parsnp

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load parsnp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Parsnp on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=parsnp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers parsnp

    parsnp -g examples/mers_virus/ref/England1.gbk \
         -d examples/mers_virus/genomes/*.fna -c -p 8
.. _Github: https://github.com/marbl/parsnp
