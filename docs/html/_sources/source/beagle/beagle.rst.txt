.. _backbone-label:

Beagle
==============================

Introduction
~~~~~~~~
Beagle is is a software package for phasing genotypes and for imputing ungenotyped markers. Start it with: beagle [java options] [arguments] Note: Bref is not installed in this container.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/beagle 
| Home page: https://faculty.washington.edu/browning/beagle/beagle.html

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
    - 5.1_24Aug19.3e8
  * - BELL
    - 5.1_24Aug19.3e8
  * - GAUTSCHI
    - 5.1_24Aug19.3e8
  * - NEGISHI
    - 5.1_24Aug19.3e8
  * - SCHOLAR
    - 5.1_24Aug19.3e8

Commands
~~~~~~~
- beagle
- java

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load beagle

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run beagle on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=beagle
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers beagle
