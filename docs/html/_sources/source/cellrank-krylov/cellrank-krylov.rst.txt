.. _backbone-label:

Cellrank-krylov
==============================

Introduction
~~~~~~~~
Cellrank-krylov is the cellrank package with extra libraries that are useful for large datasets.


| For more information, please check:
| Home page: https://cellrank.readthedocs.io/en/stable/index.html

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
    - 1.5.1
  * - BELL
    - 1.5.1
  * - GAUTSCHI
    - 1.5.1
  * - NEGISHI
    - 1.5.1
  * - SCHOLAR
    - 1.5.1

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cellrank-krylov

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cellrank-krylov on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cellrank-krylov
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellrank-krylov
