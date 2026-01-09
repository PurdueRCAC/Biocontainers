.. _backbone-label:

Cellxgene
==============================

Introduction
~~~~~~~~
CZ CELLxGENE Annotate (pronounced "cell-by-gene") is an interactive data explorer for single-cell datasets


| For more information, please check:
| BioContainers: https://hub.docker.com/r/arnstrm2/cellxgene 
| Home page: https://cellxgene.cziscience.com/docs/01__CellxGene

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - BELL
    - 1.3.0
  * - NEGISHI
    - 1.3.0

Commands
~~~~~~~
- cellxgene

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellxgene

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellxgene on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellxgene
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellxgene
