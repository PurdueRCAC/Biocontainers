.. _backbone-label:

CICERO
==============================

Introduction
~~~~~~~~
``CICERO`` (Clipped-reads Extended for RNA Optimization) is an assembly-based algorithm to detect diverse classes of driver gene fusions from RNA-seq. |For more information, please check its home page on `Github`_.

Versions
~~~~~~~~
- 1.8.1

Commands
~~~~~~~
- Cicero.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cicero

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run CICERO on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cicero
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cicero

.. _Github: https://github.com/stjude/CICERO
