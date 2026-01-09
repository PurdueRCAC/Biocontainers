.. _backbone-label:

Bwtool
==============================

Introduction
~~~~~~~~
bwtool: a tool for bigWig files. bwtool is a tool designed to read bigWig files rapidly and efficiently, providing functionality for extracting data and summarizing it in several ways, globally or at specific regions. Additionally, the tool enables the conversion of the positions of signal data from one genome assembly to another, also known as ‘lifting’.


| For more information, please check:
| Home page: https://github.com/CRG-Barcelona/bwtool

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.0
  * - BELL
    - 1.0
  * - GAUTSCHI
    - 1.0
  * - NEGISHI
    - 1.0

Commands
~~~~~~~
- bwtool

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bwtool

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bwtool on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bwtool
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bwtool
