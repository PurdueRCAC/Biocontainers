.. _backbone-label:

Bsaseq
==============================

Introduction
~~~~~~~~
BSAseq: Bulk Segregant Analysis for QTL mapping from pooled whole-genome sequencing data


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bsaseq 
| Home page: https://github.com/rcac-bioinformatics/bsaseq

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

  * - BELL
    - 1.0.0
  * - NEGISHI
    - 1.0.0

Commands
~~~~~~~
- bsaseq

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bsaseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bsaseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bsaseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bsaseq
