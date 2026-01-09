.. _backbone-label:

Stringdecomposer
==============================

Introduction
~~~~~~~~
Stringdecomposer is a tool for decomposition centromeric assemblies and long reads into monomers.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/stringdecomposer 
| Home page: https://github.com/ablab/stringdecomposer

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.2

Commands
~~~~~~~
- stringdecomposer

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load stringdecomposer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run stringdecomposer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=stringdecomposer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers stringdecomposer

