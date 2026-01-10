.. _backbone-label:

Rgt
==============================

Introduction
~~~~~~~~
RGT is an open source Python 3.6+ library for analysis of regulatory genomics. RGT is programmed in an oriented object fashion and its core classes provide functionality for handling regulatory genomics data. The toolbox is made of a core library and several tools: HINT: ATAC-seq/DNase-seq footprinting method THOR: ChIP-Seq differential peak caller Motif Analysis: TBFS match and enrichment RGT-Viz: Visualization tool TDF: DNA/RNA triplex domain finder


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rgt 
| Home page: https://github.com/CostaLab/reg-gen

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
    - 1.0.2
  * - BELL
    - 1.0.2_pathced, 1.0.2
  * - GAUTSCHI
    - 1.0.2
  * - NEGISHI
    - 1.0.2_pathced, 1.0.2

Commands
~~~~~~~
- rgt-TDF
- rgt-THOR
- rgt-hint
- rgt-motifanalysis
- rgt-viz

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rgt

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rgt on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rgt
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rgt
