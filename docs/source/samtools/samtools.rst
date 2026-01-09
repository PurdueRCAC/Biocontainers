.. _backbone-label:

Samtools
==============================

Introduction
~~~~~~~~
``Samtools`` is a set of utilities for the Sequence Alignment/Map (SAM) format. 

| For more information, please check its website: https://biocontainers.pro/tools/samtools and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.9, 1.15, 1.16, 1.17
  * - BELL
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - GAUTSCHI
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - NEGISHI
    - 1.9, 1.15, 1.16, 1.17, 1.22.1
  * - SCHOLAR
    - 1.9, 1.15, 1.16, 1.17

Commands
~~~~~~~
- samtools
- ace2sam
- htsfile
- maq2sam-long
- maq2sam-short
- tabix
- wgsim

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load samtools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Samtools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=samtools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers samtools

.. _Github: https://github.com/samtools/samtools
