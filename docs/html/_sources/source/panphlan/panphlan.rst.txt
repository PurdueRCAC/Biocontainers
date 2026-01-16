.. _backbone-label:

Panphlan
==============================

Introduction
~~~~~~~~
Pangenome-based Phylogenomic Analysis (PanPhlAn) is a strain-level metagenomic profiling tool for identifying the gene composition and in-vivo transcriptional activity of individual strains in metagenomic samples.


| For more information, please check:
| Home page: http://segatalab.cibio.unitn.it/tools/panphlan/

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
    - 3.1
  * - BELL
    - 3.1
  * - GAUTSCHI
    - 3.1
  * - NEGISHI
    - 3.1
  * - SCHOLAR
    - 3.1

Commands
~~~~~~~
- panphlan_download_pangenome.py
- panphlan_map.py
- panphlan_profiling.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load panphlan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run panphlan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=panphlan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers panphlan
