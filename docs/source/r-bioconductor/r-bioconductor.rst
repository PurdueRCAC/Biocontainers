.. _backbone-label:

R-bioconductor
==============================

Introduction
~~~~~~~~
R is a system for statistical computation and graphics. This is a r/4.4.2 Apptainer image with main R packages and Bioconductor installed. RStudio is an integrated development environment (IDE) for the R statistical computation and graphics system.


| For more information, please check:
| Home page: https://www.rstudio.com/products/rstudio/ 
| Home page: https://www.r-project.org/

Versions
~~~~~~~~
- 3.20-R-4.4.3

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r-bioconductor

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-bioconductor on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-bioconductor
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-bioconductor
