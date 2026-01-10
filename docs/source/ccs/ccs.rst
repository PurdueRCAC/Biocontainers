.. _backbone-label:

Ccs
==============================

Introduction
~~~~~~~~
Pbccs is a tool to generate Highly Accurate Single-Molecule Consensus Reads (HiFi Reads).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pbccs 
| Home page: https://github.com/PacificBiosciences/ccs

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
    - 6.4.0
  * - BELL
    - 6.4.0
  * - GAUTSCHI
    - 6.4.0
  * - NEGISHI
    - 6.4.0
  * - SCHOLAR
    - 6.4.0

Commands
~~~~~~~
- ccs

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ccs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ccs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ccs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ccs
