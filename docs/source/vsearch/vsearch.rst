.. _backbone-label:

Vsearch
==============================

Introduction
~~~~~~~~
Vsearch is a versatile open source tool for metagenomics.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/vsearch 
| Home page: https://github.com/torognes/vsearch

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
    - 2.19.0, 2.21.1, 2.22.1
  * - BELL
    - 2.19.0, 2.21.1, 2.22.1
  * - GAUTSCHI
    - 2.19.0, 2.21.1, 2.22.1
  * - NEGISHI
    - 2.19.0, 2.21.1, 2.22.1
  * - SCHOLAR
    - 2.19.0, 2.21.1, 2.22.1

Commands
~~~~~~~
- vsearch

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vsearch

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vsearch on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vsearch
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vsearch
