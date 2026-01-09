.. _backbone-label:

Pplacer
==============================

Introduction
~~~~~~~~
Pplacer places query sequences on a fixed reference phylogenetic tree to maximize phylogenetic likelihood or posterior probability according to a reference alignment, guppy does all of the downstream analysis of placements, and rppr does useful things having to do with reference packages.
For more information, please check:
BioContainers: https://biocontainers.pro/tools/pplacer 
Home page: https://matsen.fhcrc.org/pplacer/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.1.alpha19
  * - BELL
    - 1.1.alpha19
  * - GAUTSCHI
    - 1.1.alpha19
  * - NEGISHI
    - 1.1.alpha19
  * - SCHOLAR
    - 1.1.alpha19

Commands
~~~~~~~
- pplacer
- guppy
- rppr

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load pplacer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run pplacer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pplacer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pplacer
