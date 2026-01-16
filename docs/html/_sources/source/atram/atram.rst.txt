.. _backbone-label:

Atram
==============================

Introduction
~~~~~~~~
aTRAM ("automated target restricted assembly method") is an iterative assembler that performs reference-guided local de novo assemblies using a variety of available methods.


| For more information, please check:
| Home page: https://github.com/juliema/aTRAM

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
    - 2.4.3
  * - BELL
    - 2.4.3
  * - GAUTSCHI
    - 2.4.3
  * - NEGISHI
    - 2.4.3
  * - SCHOLAR
    - 2.4.3

Commands
~~~~~~~
- atram_preprocessor.py
- atram.py
- atram_stitcher.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load atram

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run atram on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=atram
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers atram
