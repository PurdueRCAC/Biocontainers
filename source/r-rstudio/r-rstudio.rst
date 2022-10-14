.. _backbone-label:

RStudio
==============================

Introduction
~~~~~~~~
``RStudio`` is an integrated development environment (IDE) for the R statistical computation and graphics system.

This is an RStudio IDE together with a plain R-base installation (see https://github.com/rocker-org/rocker/), repackaged by RCAC with an addition of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2 and libXt) and their header files.  It is intentionally separate from the biocontainers' 'r' module for reasons of image size (700MB vs 360MB).

|For more information, please check its |Docker hub: https://hub.docker.com/_/r-base and its home page: https://www.rstudio.com/products/rstudio/ and https://www.r-project.org/.

Versions
~~~~~~~~
- 4.1.1

Commands
~~~~~~~
- R
- Rscript
- rstudio

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load r-studio

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run RStudio on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-studio
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-studio
