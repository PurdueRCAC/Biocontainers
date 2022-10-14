.. _backbone-label:

RepeatModeler
==============================

Introduction
~~~~~~~~
``RepeatModeler`` is a de novo transposable element (TE) family identification and modeling package. | For more information, please check its website: https://biocontainers.pro/tools/repeatmodeler and its home page: http://www.repeatmasker.org/RepeatModeler/.

Versions
~~~~~~~~
- 2.0.2
- 2.0.3

Commands
~~~~~~~
- RepeatModeler
- BuildDatabase
- RepeatClassifier

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load repeatmodeler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run RepeatModeler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=repeatmodeler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers repeatmodeler
