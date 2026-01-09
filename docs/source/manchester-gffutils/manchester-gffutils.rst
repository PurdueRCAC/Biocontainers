.. _backbone-label:

Manchester-gffutils
==============================

Introduction
~~~~~~~~
The University of Manchester GFFUtils package provides a small set of utility programs for working with GFF and GTF files.


| For more information, please check:
| Home page: https://github.com/fls-bioinformatics-core/GFFUtils

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.12.0
  * - BELL
    - 0.12.0
  * - GAUTSCHI
    - 0.12.0
  * - NEGISHI
    - 0.12.0

Commands
~~~~~~~
- gff_cleaner
- gff_annotation_extractor
- gtf_extract
- gtf2bed

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load manchester-gffutils

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run manchester-gffutils on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=manchester-gffutils
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers manchester-gffutils
