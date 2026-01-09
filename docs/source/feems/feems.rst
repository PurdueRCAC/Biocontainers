.. _backbone-label:

Feems
==============================

Introduction
~~~~~~~~
Fast Estimation of Effective Migration Surfaces (feems) is a python package implementing a statistical method for inferring and visualizing gene-flow in spatial population genetic data.


| For more information, please check:
| BioContainers: 
| Home page: https://github.com/NovembreLab/feems

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.0.0

Commands
~~~~~~~
- python
- jupyter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load feems

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run feems on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=feems
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers feems

