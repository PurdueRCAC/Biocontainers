.. _backbone-label:

Srst2
==============================

Introduction
~~~~~~~~
Srst2 is designed to take Illumina sequence data, a MLST database and/or a database of gene sequences (e.g. resistance genes, virulence genes, etc) and report the presence of STs and/or reference genes.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/srst2 
| Home page: https://github.com/katholt/srst2

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
    - 0.2.0
  * - BELL
    - 0.2.0
  * - GAUTSCHI
    - 0.2.0
  * - NEGISHI
    - 0.2.0
  * - SCHOLAR
    - 0.2.0

Commands
~~~~~~~
- getmlst.py
- srst2
- slurm_srst2.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load srst2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run srst2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=srst2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers srst2
