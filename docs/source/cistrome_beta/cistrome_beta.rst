.. _backbone-label:

Cistrome_beta
==============================

Introduction
~~~~~~~~
Binding and Expression Target Analysis (BETA) is a software package that integrates ChIP-seq of transcription factors or chromatin regulators with differential gene expression data to infer direct target genes


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/cistrome_beta 
| Home page: http://cistrome.org/BETA/index.html#inst

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

  * - NEGISHI
    - 1.0.7-py27

Commands
~~~~~~~
- BETA

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load cistrome_beta

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run cistrome_beta on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cistrome_beta
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cistrome_beta
