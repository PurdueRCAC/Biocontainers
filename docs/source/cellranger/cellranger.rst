.. _backbone-label:

Cellranger
==============================

Introduction
~~~~~~~~
Cellranger is a set of analysis pipelines that process Chromium single-cell data to align reads, generate feature-barcode matrices, perform clustering and other secondary analysis, and more.


| For more information, please check:
| DockerHub: https://hub.docker.com/r/cumulusprod/cellranger 
| Home page: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/what-is-cell-ranger

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
    - 6.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0
  * - BELL
    - 6.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0, 9.0.1
  * - GAUTSCHI
    - 6.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0
  * - NEGISHI
    - 6.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0, 9.0.1, 10.0.0
  * - SCHOLAR
    - 6.0.1, 6.1.1, 6.1.2, 7.0.0, 7.0.1, 7.1.0

Commands
~~~~~~~
- cellranger

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellranger

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellranger on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellranger
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellranger
