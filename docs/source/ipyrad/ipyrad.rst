.. _backbone-label:

Ipyrad
==============================

Introduction
~~~~~~~~
ipyrad is an interactive toolkit for assembly and analysis of restriction-site associated genomic data sets (e.g., RAD, ddRAD, GBS) for population genetic and phylogenetic studies.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ipyrad 
| Home page: https://github.com/dereneaton/ipyrad

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.9.102
  * - BELL
    - 0.9.102
  * - GAUTSCHI
    - 0.9.102
  * - NEGISHI
    - 0.9.102

Commands
~~~~~~~
- ipyrad

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ipyrad

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ipyrad on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ipyrad
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ipyrad
