.. _backbone-label:

Genrich
==============================

Introduction
~~~~~~~~
Genrich is a peak-caller for genomic enrichment assays (e.g. ChIP-seq, ATAC-seq). It analyzes alignment files generated following the assay and produces a file detailing peaks of significant enrichment.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/genrich 
| Home page: https://github.com/jsh58/Genrich

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
    - 0.6.1
  * - BELL
    - 0.6.1
  * - GAUTSCHI
    - 0.6.1
  * - NEGISHI
    - 0.6.1
  * - SCHOLAR
    - 0.6.1

Commands
~~~~~~~
- Genrich

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load genrich

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run genrich on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genrich
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genrich
