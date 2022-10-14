.. _backbone-label:

Gadma
==============================

Introduction
~~~~~~~~
GADMA is a command-line tool. Basic pipeline presents a series of launches of the genetic algorithm folowed by local search optimization and infers demographic history from the Allele Frequency Spectrum of multiple populations (up to three).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gadma 
| Home page: https://github.com/ctlab/GADMA

Versions
~~~~~~~~
- 2.0.0rc21

Commands
~~~~~~~
- gadma
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gadma

Interactive job
~~~~~
To run GADMA interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers gadma
   (base) UserID@bell-a008:~ $ python
   Python 3.8.13 |  packaged by conda-forge |  (default, Mar 25 2022, 06:04:10)
   [GCC 10.3.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.  
   >>> from gadma import *

Batch job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gadma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gadma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gadma

    gadma -p params_file
