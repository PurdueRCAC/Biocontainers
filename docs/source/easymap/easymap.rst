.. _backbone-label:

Easymap
==============================

Introduction
~~~~~~~~
Easymap v2 — A web-based and command-line tool for mapping-by-sequencing, SNP/indel identification, and linkage analysis. This module provides access to the Easymap v2 container and the run_easymap server launcher used by OnDemand.


| For more information, please check:
| GitHub: https://github.com/MicolLab/easymap 
| Documentation: http://genetics.edu.umh.es/resources/easymap/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - BELL
    - 2.0
  * - NEGISHI
    - 2.0

Commands
~~~~~~~

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load easymap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run easymap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=easymap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers easymap
