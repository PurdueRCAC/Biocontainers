.. _backbone-label:

Beast2
==============================

Introduction
~~~~~~~~
BEAST 2 is a cross-platform program for Bayesian phylogenetic analysis of molecular sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/beast2 
| Home page: https://www.beast2.org

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
    - 2.6.3, 2.6.4, 2.6.6
  * - BELL
    - 2.6.3, 2.6.4, 2.6.6
  * - GAUTSCHI
    - 2.6.3, 2.6.4, 2.6.6
  * - NEGISHI
    - 2.6.3, 2.6.4, 2.6.6
  * - SCHOLAR
    - 2.6.3, 2.6.4, 2.6.6

Commands
~~~~~~~
- applauncher
- beast
- beauti
- densitree
- loganalyser
- logcombiner
- packagemanager
- treeannotator

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load beast2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run beast2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=beast2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers beast2
