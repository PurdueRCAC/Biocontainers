.. _backbone-label:

Sepp
==============================

Introduction
~~~~~~~~
Sepp stands for SATé-Enabled Phylogenetic Placement and addresses the problem of phylogenetic placement for meta-genomic short reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/sepp 
| Home page: https://github.com/smirarab/sepp

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
    - 4.5.1
  * - BELL
    - 4.5.1
  * - GAUTSCHI
    - 4.5.1
  * - NEGISHI
    - 4.5.1
  * - SCHOLAR
    - 4.5.1

Commands
~~~~~~~
- run_sepp.py
- run_upp.py
- split_sequences.py
- sumlabels.py
- sumtrees.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sepp

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sepp on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sepp
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sepp
