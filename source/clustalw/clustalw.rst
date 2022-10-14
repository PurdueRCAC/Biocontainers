.. _backbone-label:

Clustalw
==============================

Introduction
~~~~~~~~
``Clustalw`` is a general purpose multiple alignment program for DNA or proteins. | For more information, please check its website: https://biocontainers.pro/tools/clustalw and its home page: http://www.clustal.org/clustal2/.

Versions
~~~~~~~~
- 2.1

Commands
~~~~~~~
- clustalw

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load clustalw

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Clustalw on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clustalw
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clustalw

    clustalw -tree -align -infile=seq.faa
