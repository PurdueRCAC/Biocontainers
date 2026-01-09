.. _backbone-label:

Bcfanno
==============================

Introduction
~~~~~~~~
Bcfanno was designed to annotate genetic variants with various biological databases and predict the variant types and HGVS names quickly.


| For more information, please check:
| Home page: https://github.com/shiquan/bcfanno

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2020.10.25
  * - BELL
    - 2020.10.25
  * - GAUTSCHI
    - 2020.10.25
  * - NEGISHI
    - 2020.10.25

Commands
~~~~~~~
- bcfanno

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bcfanno

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bcfanno on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bcfanno
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bcfanno
