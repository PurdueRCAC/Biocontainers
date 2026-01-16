.. _backbone-label:

Run_dbcan
==============================

Introduction
~~~~~~~~
Run_dbcan is a standalone tool of http://bcb.unl.edu/dbCAN2/


| For more information, please check:
| Home page: https://github.com/linnabrown/run_dbcan

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
    - 3.0.2, 3.0.6
  * - BELL
    - 3.0.2, 3.0.6
  * - GAUTSCHI
    - 3.0.2, 3.0.6
  * - NEGISHI
    - 3.0.2, 3.0.6
  * - SCHOLAR
    - 3.0.2, 3.0.6

Commands
~~~~~~~
- run_dbcan

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load run_dbcan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run run_dbcan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=run_dbcan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers run_dbcan
