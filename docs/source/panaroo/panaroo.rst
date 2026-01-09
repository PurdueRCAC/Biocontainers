.. _backbone-label:

Panaroo
==============================

Introduction
~~~~~~~~
Panaroo is an updated pipeline for pangenome investigation.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/panaroo 
| Home page: https://github.com/gtonkinhill/panaroo

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.2.10
  * - BELL
    - 1.2.10
  * - GAUTSCHI
    - 1.2.10
  * - NEGISHI
    - 1.2.10
  * - SCHOLAR
    - 1.2.10

Commands
~~~~~~~
- panaroo
- panaroo-extract-gene
- panaroo-filter-pa
- panaroo-fmg
- panaroo-gene-neighbourhood
- panaroo-img
- panaroo-integrate
- panaroo-merge
- panaroo-msa
- panaroo-plot-abundance
- panaroo-qc
- panaroo-spydrpick

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load panaroo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run panaroo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=panaroo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers panaroo

    panaroo -i gff/*.gff -o results --clean-mode strict
