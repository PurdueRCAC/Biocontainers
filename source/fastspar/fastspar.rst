.. _backbone-label:

Fastspar
==============================

Introduction
~~~~~~~~
``Fastspar`` is a tool for rapid and scalable correlation estimation for compositional data. 

| For more information, please check its website: https://biocontainers.pro/tools/fastspar and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.0

Commands
~~~~~~~
- fastspar
- fastspar_bootstrap
- fastspar_pvalues
- fastspar_reduce

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fastspar

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Fastspar on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastspar
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastspar

.. _Github: https://github.com/scwatts/fastspar
