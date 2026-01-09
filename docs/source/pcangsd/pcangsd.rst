.. _backbone-label:

Pcangsd
==============================

Introduction
~~~~~~~~
PCAngsd is a program that estimates the covariance matrix and individual allele frequencies for low-depth next-generation sequencing (NGS) data in structured/heterogeneous populations using principal component analysis (PCA) to perform multiple population genetic analyses using genotype likelihoods.


| For more information, please check:
| Home page: https://github.com/Rosemeis/pcangsd

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.10

Commands
~~~~~~~
- pcangsd

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pcangsd

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pcangsd on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pcangsd
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pcangsd

