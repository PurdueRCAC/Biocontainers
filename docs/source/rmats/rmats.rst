.. _backbone-label:

Rmats
==============================

Introduction
~~~~~~~~
Rmats is a computational tool to detect differential alternative splicing events from RNA-Seq data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/rmats 
| Home page: http://rnaseq-mats.sourceforge.net

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
    - 4.1.1
  * - BELL
    - 4.1.1, 4.3.0
  * - GAUTSCHI
    - 4.1.1
  * - NEGISHI
    - 4.1.1, 4.3.0
  * - SCHOLAR
    - 4.1.1

Commands
~~~~~~~
- FDR.py
- RNASeq-MATS.py
- inclusion_level.py
- joinFiles.py
- paste.py
- rmats.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load rmats

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run rmats on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=rmats
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rmats
