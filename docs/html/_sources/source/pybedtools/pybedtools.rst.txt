.. _backbone-label:

Pybedtools
==============================

Introduction
~~~~~~~~
Pybedtools wraps and extends BEDTools and offers feature-level manipulations from within Python.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pybedtools 
| Home page: https://github.com/daler/pybedtools

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
    - 0.9.0
  * - BELL
    - 0.9.0
  * - GAUTSCHI
    - 0.9.0
  * - NEGISHI
    - 0.9.0
  * - SCHOLAR
    - 0.9.0

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pybedtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pybedtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pybedtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pybedtools
