.. _backbone-label:

Ragout
==============================

Introduction
~~~~~~~~
``Ragout`` is a tool for chromosome-level scaffolding using multiple references. | For more information, please check its website: https://biocontainers.pro/tools/ragout and its home page on `Github`_.

Versions
~~~~~~~~
- 2.3-py37

Commands
~~~~~~~
- ragout

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ragout

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Ragout on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ragout
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ragout

.. _Github: https://github.com/fenderglass/Ragout
