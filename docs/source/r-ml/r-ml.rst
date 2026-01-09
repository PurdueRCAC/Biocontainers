.. _backbone-label:

R-ml
==============================

Introduction
~~~~~~~~
R is a system for statistical computation and graphics. This is a r/4.5.1 Apptainer image with main R packages for machine learning and GPU-based computation in R


| For more information, please check:
| r-ml: https://rocker-project.org/images/versioned/cuda.html 
| Home page: https://rocker-project.org/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - GILBRETH
    - 4.5.1

Commands
~~~~~~~
- R
- Rscript
- rstudio-server

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r-ml

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-ml on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-ml
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-ml
