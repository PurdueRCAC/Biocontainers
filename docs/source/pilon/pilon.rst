.. _backbone-label:

Pilon
==============================

Introduction
~~~~~~~~
Pilon is an automated genome assembly improvement and variant detection tool.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pilon 
| Home page: https://github.com/broadinstitute/pilon/

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
    - 1.24
  * - BELL
    - 1.24
  * - GAUTSCHI
    - 1.24
  * - NEGISHI
    - 1.24
  * - SCHOLAR
    - 1.24

Commands
~~~~~~~
- pilon.jar

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pilon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pilon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pilon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pilon
