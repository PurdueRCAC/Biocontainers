.. _backbone-label:

Crispritz
==============================

Introduction
~~~~~~~~
Crispritz is a software package containing 5 different tools dedicated to perform predictive analysis and result assessement on CRISPR/Cas experiments.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/crispritz 
| Home page: https://github.com/pinellolab/CRISPRitz

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
    - 2.6.5
  * - BELL
    - 2.6.5
  * - GAUTSCHI
    - 2.6.5
  * - NEGISHI
    - 2.6.5
  * - SCHOLAR
    - 2.6.5

Commands
~~~~~~~
- crispritz.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load crispritz

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run crispritz on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=crispritz
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers crispritz
