.. _backbone-label:

Cellsnp-lite
==============================

Introduction
~~~~~~~~
cellSNP aims to pileup the expressed alleles in single-cell or bulk RNA-seq data, which can be directly used for donor deconvolution in multiplexed single-cell RNA-seq data, particularly with vireo, which assigns cells to donors and detects doublets, even without genotyping reference.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cellsnp-lite 
| Home page: https://github.com/single-cell-genetics/cellSNP

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
    - 1.2.2
  * - BELL
    - 1.2.2
  * - GAUTSCHI
    - 1.2.2
  * - NEGISHI
    - 1.2.2
  * - SCHOLAR
    - 1.2.2

Commands
~~~~~~~
- cellsnp-lite

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellsnp-lite

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellsnp-lite on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellsnp-lite
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellsnp-lite
