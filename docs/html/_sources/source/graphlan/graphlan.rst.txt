.. _backbone-label:

Graphlan
==============================

Introduction
~~~~~~~~
Graphlan is a software tool for producing high-quality circular representations of taxonomic and phylogenetic trees.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/graphlan 
| Home page: https://huttenhower.sph.harvard.edu/graphlan/

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
    - 1.1.3
  * - BELL
    - 1.1.3
  * - GAUTSCHI
    - 1.1.3
  * - NEGISHI
    - 1.1.3
  * - SCHOLAR
    - 1.1.3

Commands
~~~~~~~
- graphlan.py
- graphlan_annotate.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load graphlan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run graphlan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=graphlan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers graphlan
