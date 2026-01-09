.. _backbone-label:

Singlem
==============================

Introduction
~~~~~~~~
SingleM is a tool for profiling shotgun metagenomes. It has a particular strength in detecting microbial lineages which are not in reference databases. The method it uses also makes it suitable for some related tasks, such as assessing eukaryotic contamination, finding bias in genome recovery, computing ecological diversity metrics, and lineage-targeted MAG recovery.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/wwood/singlem 
| Home page: https://github.com/wwood/singlem

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.13.2
  * - BELL
    - 0.13.2
  * - GAUTSCHI
    - 0.13.2
  * - NEGISHI
    - 0.13.2
  * - SCHOLAR
    - 0.13.2

Commands
~~~~~~~
- singlem

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load singlem

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run singlem on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=singlem
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers singlem
