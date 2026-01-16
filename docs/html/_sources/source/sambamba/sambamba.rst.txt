.. _backbone-label:

Sambamba
==============================

Introduction
~~~~~~~~
Sambamba is a high performance highly parallel robust and fast tool (and library), written in the D programming language, for working with SAM and BAM files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/sambamba 
| Home page: https://github.com/biod/sambamba

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
    - 0.8.2
  * - BELL
    - 0.8.2
  * - GAUTSCHI
    - 0.8.2
  * - NEGISHI
    - 0.8.2
  * - SCHOLAR
    - 0.8.2

Commands
~~~~~~~
- sambamba

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sambamba

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sambamba on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sambamba
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sambamba
