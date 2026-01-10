.. _backbone-label:

Scanpy
==============================

Introduction
~~~~~~~~
Scanpy is a scalable toolkit for analyzing single-cell gene expression data built jointly with anndata.


| For more information, please check:
| Home page: https://scanpy.readthedocs.io/en/stable/

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
    - 1.8.2, 1.9.1
  * - BELL
    - 1.8.2, 1.9.1
  * - GAUTSCHI
    - 1.8.2, 1.9.1
  * - NEGISHI
    - 1.8.2, 1.9.1
  * - SCHOLAR
    - 1.8.2, 1.9.1

Commands
~~~~~~~
- python
- python3
- jupyter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load scanpy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run scanpy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=scanpy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers scanpy
