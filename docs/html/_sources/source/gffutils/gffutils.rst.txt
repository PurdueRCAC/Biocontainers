.. _backbone-label:

Gffutils
==============================

Introduction
~~~~~~~~
gffutils is a Python package for working with and manipulating the GFF and GTF format files typically used for genomic annotations.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gffutils 
| Home page: https://github.com/daler/gffutils

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
    - 0.11.1
  * - BELL
    - 0.11.1
  * - GAUTSCHI
    - 0.11.1
  * - NEGISHI
    - 0.11.1
  * - SCHOLAR
    - 0.11.1

Commands
~~~~~~~
- python
- python3

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gffutils

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gffutils on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gffutils
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gffutils
