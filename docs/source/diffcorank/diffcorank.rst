.. _backbone-label:

Diffcorank
==============================

Introduction
~~~~~~~~
DiffCoRank: A Comprehensive Framework for Discovering Hub Genes and Differential Gene Co-expression in Brain Implant-Associated Tissue Responses. This module provides the `diffcorank` command to launch the Streamlit web app inside the container.


| For more information, please check:
| BioContainers: https://hub.docker.com/r/anirban1231/diffcorank 
| Home page: https://github.com/msureil/DiffCoRank

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - NEGISHI
    - 1.0

Commands
~~~~~~~

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load diffcorank

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run diffcorank on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=diffcorank
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers diffcorank
