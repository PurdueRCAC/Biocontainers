.. _backbone-label:

Velocyto.py
==============================

Introduction
~~~~~~~~
Velocyto.py is a tool used for RNA velocity estimation in Python.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/velocyto.py 
| Home page: https://github.com/velocyto-team/velocyto.py

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
    - 0.17.17
  * - BELL
    - 0.17.17
  * - GAUTSCHI
    - 0.17.17
  * - NEGISHI
    - 0.17.17
  * - SCHOLAR
    - 0.17.17

Commands
~~~~~~~
- velocyto
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load velocyto.py

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run velocyto.py on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=velocyto.py
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers velocyto.py
