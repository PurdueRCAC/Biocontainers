.. _backbone-label:

Gapfiller
==============================

Introduction
~~~~~~~~
GapFiller is a seed-and-extend local assembler to fill the gap within paired reads. It can be used for both DNA and RNA and it has been tested on Illumina data. GapFiller can be used whenever a sequence is to be assembled starting from reads lying on its ends, provided a loose estimate of sequence length.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gapfiller 
| Home page: https://sourceforge.net/projects/gapfiller/

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
    - 2.1.2
  * - BELL
    - 2.1.2
  * - GAUTSCHI
    - 2.1.2
  * - NEGISHI
    - 2.1.2
  * - SCHOLAR
    - 2.1.2

Commands
~~~~~~~
- GapFiller

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gapfiller

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gapfiller on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gapfiller
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gapfiller
