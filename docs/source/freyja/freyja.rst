.. _backbone-label:

Freyja
==============================

Introduction
~~~~~~~~
Freyja is a tool to recover relative lineage abundances from mixed SARS-CoV-2 samples from a sequencing dataset (BAM aligned to the Hu-1 reference). The method uses lineage-determining mutational "barcodes" derived from the UShER global phylogenetic tree as a basis set to solve the constrained (unit sum, non-negative) de-mixing problem.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/freyja 
| Home page: https://github.com/andersen-lab/Freyja

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.3.11, 1.4.2
  * - BELL
    - 1.3.11, 1.4.2
  * - GAUTSCHI
    - 1.3.11, 1.4.2
  * - NEGISHI
    - 1.3.11, 1.4.2
  * - SCHOLAR
    - 1.3.11, 1.4.2

Commands
~~~~~~~
- freyja

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load freyja

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run freyja on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=freyja
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers freyja
