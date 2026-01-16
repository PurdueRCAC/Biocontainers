.. _backbone-label:

Trtools
==============================

Introduction
~~~~~~~~
TRTools includes a variety of utilities for filtering, quality control and analysis of tandem repeats downstream of genotyping them from next-generation sequencing.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/trtools 
| Home page: https://github.com/gymreklab/TRTools

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
    - 5.0.1
  * - BELL
    - 5.0.1
  * - GAUTSCHI
    - 5.0.1
  * - NEGISHI
    - 5.0.1
  * - SCHOLAR
    - 5.0.1

Commands
~~~~~~~
- associaTR
- compareSTR
- dumpSTR
- mergeSTR
- qcSTR
- statSTR

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load trtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run trtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trtools
