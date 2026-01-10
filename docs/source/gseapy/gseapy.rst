.. _backbone-label:

Gseapy
==============================

Introduction
~~~~~~~~
Gseapy is a python wrapper for GESA and Enrichr.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gseapy 
| Home page: https://gseapy.readthedocs.io/en/latest/introduction.html

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
    - 0.10.8
  * - BELL
    - 0.10.8
  * - GAUTSCHI
    - 0.10.8
  * - NEGISHI
    - 0.10.8
  * - SCHOLAR
    - 0.10.8

Commands
~~~~~~~
- gseapy
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gseapy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gseapy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gseapy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gseapy
