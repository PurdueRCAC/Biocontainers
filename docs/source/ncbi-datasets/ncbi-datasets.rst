.. _backbone-label:

Ncbi-datasets
==============================

Introduction
~~~~~~~~
NCBI Datasets is a new resource that lets you easily gather data from across NCBI databases. You can use it to find and download sequence, annotation, and metadata for genes and genomes using our command-line interface (CLI) tools or NCBI Datasets web interface.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/ncbi-datasets 
| Home page: https://github.com/ncbi/datasets

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 14.3.0, 16.10.3
  * - BELL
    - 14.3.0, 16.10.3, 18.0.2
  * - GAUTSCHI
    - 14.3.0, 16.10.3
  * - NEGISHI
    - 14.3.0, 16.10.3, 18.0.2
  * - SCHOLAR
    - 14.3.0

Commands
~~~~~~~
- datasets
- dataformat

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ncbi-datasets

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ncbi-datasets on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ncbi-datasets
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-datasets
