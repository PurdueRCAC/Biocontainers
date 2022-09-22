.. _backbone-label:

Shortstack
==============================

Introduction
~~~~~~~~
``Shortstack`` is a tool for comprehensive annotation and quantification of small RNA genes. For more information, please check its website: https://biocontainers.pro/tools/shortstack and its home page on `Github`_.

Versions
~~~~~~~~
- 3.8.5

Commands
~~~~~~~
- ShortStack

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load shortstack

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Shortstack on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shortstack
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shortstack

.. _Github: https://github.com/MikeAxtell/ShortStack
