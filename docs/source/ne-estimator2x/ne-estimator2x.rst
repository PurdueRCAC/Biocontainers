.. _backbone-label:

Ne-estimator2x
==============================

Introduction
~~~~~~~~
NeEstimator v2 is a completely revised and updated implementation of software that produces estimates of contemporary effective population size, using several different methods and a single input file.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/neestimator2x 
| Home page: http://www.molecularfisherieslaboratory.com.au

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.2.1

Commands
~~~~~~~
- NeEstimator2x
- Ne2L

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ne-estimator2x

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ne-estimator2x on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ne-estimator2x
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ne-estimator2x
