.. _backbone-label:

Shortstack
==============================

Introduction
~~~~~~~~
Shortstack is a tool for comprehensive annotation and quantification of small RNA genes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/shortstack 
| Home page: https://github.com/MikeAxtell/ShortStack

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
    - 3.8.5
  * - BELL
    - 3.8.5
  * - GAUTSCHI
    - 3.8.5
  * - NEGISHI
    - 3.8.5
  * - SCHOLAR
    - 3.8.5

Commands
~~~~~~~
- ShortStack

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load shortstack

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run shortstack on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shortstack
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shortstack
