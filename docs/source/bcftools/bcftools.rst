.. _backbone-label:

Bcftools
==============================

Introduction
~~~~~~~~
Bcftools is a program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bcftools 
| Home page: https://samtools.github.io/bcftools/bcftools.html

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
    - 1.13, 1.14, 1.17
  * - BELL
    - 1.13, 1.14, 1.17
  * - GAUTSCHI
    - 1.13, 1.14, 1.17
  * - NEGISHI
    - 1.13, 1.14, 1.17
  * - SCHOLAR
    - 1.13, 1.14, 1.17

Commands
~~~~~~~
- bcftools
- color-chrs.pl
- guess-ploidy.py
- plot-roh.py
- plot-vcfstats
- run-roh.pl
- vcfutils.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bcftools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bcftools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bcftools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bcftools
