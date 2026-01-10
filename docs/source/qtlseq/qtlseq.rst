.. _backbone-label:

Qtlseq
==============================

Introduction
~~~~~~~~
Bulked segregant analysis, as implemented in QTL-seq (Takagi et al., 2013), is a powerful and efficient method to identify agronomically important loci in crop plants. QTL-seq was adapted from MutMap to identify quantitative trait loci. It utilizes sequences pooled from two segregating progeny populations with extreme opposite traits (e.g. resistant vs susceptible) and a single whole-genome resequencing of either of the parental cultivars.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/qtlseq 
| Home page: https://github.com/YuSugihara/QTL-seq#What-is-QTL-seq

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
    - 2.2.3
  * - BELL
    - 2.2.3
  * - GAUTSCHI
    - 2.2.3
  * - NEGISHI
    - 2.2.3
  * - SCHOLAR
    - 2.2.3

Commands
~~~~~~~
- qtlseq

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load qtlseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run qtlseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=qtlseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers qtlseq
