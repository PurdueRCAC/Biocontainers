.. _backbone-label:

Tpmcalculator
==============================

Introduction
~~~~~~~~
TPMCalculator quantifies mRNA abundance directly from the alignments by parsing BAM files.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/tpmcalculator 
| Home page: https://github.com/ncbi/TPMCalculator

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
    - 0.0.3, 0.0.4
  * - BELL
    - 0.0.3, 0.0.4
  * - GAUTSCHI
    - 0.0.3, 0.0.4
  * - NEGISHI
    - 0.0.3, 0.0.4
  * - SCHOLAR
    - 0.0.3, 0.0.4

Commands
~~~~~~~
- TPMCalculator

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tpmcalculator

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tpmcalculator on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tpmcalculator
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tpmcalculator
