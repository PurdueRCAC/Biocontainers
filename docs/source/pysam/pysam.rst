.. _backbone-label:

Pysam
==============================

Introduction
~~~~~~~~
``Pysam`` is a python module that makes it easy to read and manipulate mapped short read sequence data stored in SAM/BAM files. 

| For more information, please check its website: https://biocontainers.pro/tools/pysam and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.18.0
  * - BELL
    - 0.18.0
  * - GAUTSCHI
    - 0.18.0
  * - NEGISHI
    - 0.18.0
  * - SCHOLAR
    - 0.18.0

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pysam

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pysam on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pysam
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pysam

.. _Github: https://github.com/pysam-developers/pysam
