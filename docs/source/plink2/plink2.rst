.. _backbone-label:

Plink2
==============================

Introduction
~~~~~~~~
Plink2 is a whole genome association analysis toolset.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/plink2 
| Home page: https://bioconda.github.io/recipes/plink2/README.html

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.00a2.3

Commands
~~~~~~~
- plink2

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load plink2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run plink2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=plink2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers plink2

