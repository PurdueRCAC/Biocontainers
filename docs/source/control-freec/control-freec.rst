.. _backbone-label:

Control-freec
==============================

Introduction
~~~~~~~~
Control-freec is a tool for detection of copy-number changes and allelic imbalances (including LOH) using deep-sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/control-freec 
| Home page: https://github.com/BoevaLab/FREEC

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
    - 11.6
  * - BELL
    - 11.6
  * - GAUTSCHI
    - 11.6
  * - NEGISHI
    - 11.6
  * - SCHOLAR
    - 11.6

Commands
~~~~~~~
- freec

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load control-freec

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run control-freec on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=control-freec
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers control-freec
