.. _backbone-label:

Liftoff
==============================

Introduction
~~~~~~~~
Liftoff is an accurate GFF3/GTF lift over pipeline.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/liftoff 
| Home page: https://github.com/agshumate/Liftoff

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
    - 1.6.3
  * - BELL
    - 1.6.3
  * - GAUTSCHI
    - 1.6.3
  * - NEGISHI
    - 1.6.3
  * - SCHOLAR
    - 1.6.3

Commands
~~~~~~~
- liftoff
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load liftoff

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run liftoff on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=liftoff
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers liftoff
