.. _backbone-label:

Hubdesign
==============================

Introduction
~~~~~~~~
Hierarchical Unique Bait Design for simultaneous and specific capture of known and novel targets


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/hubdesign 
| Home page: https://github.com/zacherydickson/HUBDesign

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - BELL
    - 1.6.0
  * - NEGISHI
    - 1.6.0

Commands
~~~~~~~
- Assignment.pl
- Clustering.pl
- Config.pl
- Filtering.pl
- GetTargetRegions.pl
- HUBDesign
- Identification.pl
- Selection.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load hubdesign

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run hubdesign on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=hubdesign
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers hubdesign
