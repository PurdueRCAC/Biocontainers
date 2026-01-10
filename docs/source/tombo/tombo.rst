.. _backbone-label:

Tombo
==============================

Introduction
~~~~~~~~
Tombo is a suite of tools primarily for the identification of modified nucleotides from nanopore sequencing data. Tombo also provides tools for the analysis and visualization of raw nanopore signal.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ont-tombo 
| Home page: https://github.com/nanoporetech/tombo

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
    - 1.5.1
  * - BELL
    - 1.5.1
  * - GAUTSCHI
    - 1.5.1
  * - NEGISHI
    - 1.5.1
  * - SCHOLAR
    - 1.5.1

Commands
~~~~~~~
- tombo

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load tombo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tombo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tombo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tombo
