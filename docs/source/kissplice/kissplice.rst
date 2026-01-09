.. _backbone-label:

Kissplice
==============================

Introduction
~~~~~~~~
KisSplice is a software that enables to analyse RNA-seq data with or without a reference genome. It is an exact local transcriptome assembler that allows to identify SNPs, indels and alternative splicing events. It can deal with an arbitrary number of biological conditions, and will quantify each variant in each condition. It has been tested on Illumina datasets of up to 1G reads. Its memory consumption is around 5Gb for 100M reads.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/dwishsan/kissplice-pipeline 
| Home page: https://kissplice.prabi.fr

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.6.2
  * - BELL
    - 2.6.2
  * - GAUTSCHI
    - 2.6.2
  * - NEGISHI
    - 2.6.2
  * - SCHOLAR
    - 2.6.2

Commands
~~~~~~~
- kissplice

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load kissplice

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run kissplice on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=kissplice
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kissplice
