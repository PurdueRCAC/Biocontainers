.. _backbone-label:

Htslib
==============================

Introduction
~~~~~~~~
Htslib is a C library for high-throughput sequencing data formats.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/htslib 
| Home page: https://github.com/samtools/htslib

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
    - 1.14, 1.15, 1.16, 1.17
  * - BELL
    - 1.14, 1.15, 1.16, 1.17
  * - GAUTSCHI
    - 1.14, 1.15, 1.16, 1.17
  * - NEGISHI
    - 1.14, 1.15, 1.16, 1.17
  * - SCHOLAR
    - 1.14, 1.15, 1.16, 1.17

Commands
~~~~~~~
- bgzip
- htsfile
- tabix

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load htslib

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run htslib on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=htslib
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers htslib
