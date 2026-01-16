.. _backbone-label:

Lumpy-sv
==============================

Introduction
~~~~~~~~
Lumpy-sv is a general probabilistic framework for structural variant discovery.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/lumpy-sv 
| Home page: https://github.com/arq5x/lumpy-sv

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
    - 0.3.1
  * - BELL
    - 0.3.1
  * - GAUTSCHI
    - 0.3.1
  * - NEGISHI
    - 0.3.1
  * - SCHOLAR
    - 0.3.1

Commands
~~~~~~~
- lumpy
- lumpyexpress

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load lumpy-sv

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run lumpy-sv on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=lumpy-sv
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lumpy-sv
