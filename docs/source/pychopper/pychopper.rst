.. _backbone-label:

Pychopper
==============================

Introduction
~~~~~~~~
Pychopper is a tool to identify, orient and trim full-length Nanopore cDNA reads. The tool is also able to rescue fused reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/pychopper 
| Home page: https://github.com/nanoporetech/pychopper

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.5.0
  * - BELL
    - 2.5.0
  * - GAUTSCHI
    - 2.5.0
  * - NEGISHI
    - 2.5.0
  * - SCHOLAR
    - 2.5.0

Commands
~~~~~~~
- cdna_classifier.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pychopper

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pychopper on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pychopper
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pychopper
