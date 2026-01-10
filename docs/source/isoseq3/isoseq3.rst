.. _backbone-label:

Isoseq3
==============================

Introduction
~~~~~~~~
Isoseq3 - Scalable De Novo Isoform Discovery.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/isoseq3 
| Home page: https://github.com/PacificBiosciences/IsoSeq

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
    - 3.4.0, 3.7.0, 3.8.2
  * - BELL
    - 3.4.0, 3.7.0, 3.8.2
  * - GAUTSCHI
    - 3.4.0, 3.7.0, 3.8.2
  * - NEGISHI
    - 3.4.0, 3.7.0, 3.8.2
  * - SCHOLAR
    - 3.4.0, 3.7.0, 3.8.2

Commands
~~~~~~~
- isoseq3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load isoseq3

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run isoseq3 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=isoseq3
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers isoseq3
