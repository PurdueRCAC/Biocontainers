.. _backbone-label:

Snap-aligner
==============================

Introduction
~~~~~~~~
Snap-aligner(Scalable Nucleotide Alignment Program) is a fast and accurate read aligner for high-throughput sequencing data.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/snap-aligner 
| Home page: http://snap.cs.berkeley.edu/

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
    - 2.0.0
  * - BELL
    - 2.0.0
  * - GAUTSCHI
    - 2.0.0
  * - NEGISHI
    - 2.0.0
  * - SCHOLAR
    - 2.0.0

Commands
~~~~~~~
- snap-aligner

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load snap-aligner

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run snap-aligner on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snap-aligner
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snap-aligner
