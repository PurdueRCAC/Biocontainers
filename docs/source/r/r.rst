.. _backbone-label:

R
==============================

Introduction
~~~~~~~~
R is a system for statistical computation and graphics. This is a plain R-base installation (see https://github.com/rocker-org/rocker/) repackaged by RCAC with an addition of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2 and libXt) and their header files.


| For more information, please check:
| BioContainers: https://hub.docker.com/_/r-base (with RCAC repackaging) 
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

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r on our clusters::

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
