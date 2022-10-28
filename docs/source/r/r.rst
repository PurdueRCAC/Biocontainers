.. _backbone-label:

R
==============================

Introduction
~~~~~~~~
``R`` is a system for statistical computation and graphics. 

This is a plain R-base installation (see https://github.com/rocker-org/rocker/) repackaged by RCAC with an addition of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2 and libXt) and their header files. 



| For more information, please check its | Docker hub: https://hub.docker.com/_/r-base and its home page: https://www.r-project.org/.

Versions
~~~~~~~~
- 4.1.1

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load r

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run R on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r
