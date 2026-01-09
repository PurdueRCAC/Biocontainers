.. _backbone-label:

Disambiguate
==============================

Introduction
~~~~~~~~
Disambiguate is an algorithm for disambiguating reads aligned to two species (e.g. human and mouse genomes) from Tophat, Hisat2, STAR or BWA mem.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/disambiguate 
| Home page: https://github.com/AstraZeneca-NGS/disambiguate

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - NEGISHI
    - 1.0.0

Commands
~~~~~~~
- disambiguate
- disambiguate.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load disambiguate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run disambiguate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=disambiguate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers disambiguate
