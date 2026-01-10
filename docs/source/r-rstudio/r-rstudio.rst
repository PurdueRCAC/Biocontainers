.. _backbone-label:

R-rstudio
==============================

Introduction
~~~~~~~~
RStudio is an integrated development environment (IDE) for the R statistical computation and graphics system. This is an RStudio IDE together with a plain R-base installation (see https://github.com/rocker-org/rocker/), repackaged by RCAC with an addition of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2 and libXt) and their header files. It is intentionally separate from the biocontainers' 'r' module for reasons of image size (700MB vs 360MB).


| For more information, please check:
| BioContainers: https://hub.docker.com/_/r-base (with heavy RCAC repackaging) 
| Home page: https://www.rstudio.com/products/rstudio/ 
| Home page: https://www.r-project.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.1.1
  * - BELL
    - 4.1.1
  * - GAUTSCHI
    - 4.1.1
  * - NEGISHI
    - 4.1.1
  * - SCHOLAR
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
    module load r-rstudio

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-rstudio on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-rstudio
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-rstudio
