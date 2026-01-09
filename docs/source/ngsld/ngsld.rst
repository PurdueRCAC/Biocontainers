.. _backbone-label:

Ngsld
==============================

Introduction
~~~~~~~~
ngsLD is a program to estimate pairwise linkage disequilibrium (LD) taking the uncertainty of genotype's assignation into account. It does so by avoiding genotype calling and using genotype likelihoods or posterior probabilities.


| For more information, please check:
| Home page: https://github.com/fgvieira/ngsLD

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.1

Commands
~~~~~~~
- ngsLD

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ngsld

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ngsld on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ngsld
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ngsld

