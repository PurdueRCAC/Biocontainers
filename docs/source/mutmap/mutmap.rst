.. _backbone-label:

Mutmap
==============================

Introduction
~~~~~~~~
MutMap is a powerful and efficient method to identify agronomically important loci in crop plants.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/mutmap 
| Home page: https://github.com/YuSugihara/MutMap#What-is-MutMap

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 2.3.3

Commands
~~~~~~~
- mutmap
- mutplot

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load mutmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run mutmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mutmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mutmap

