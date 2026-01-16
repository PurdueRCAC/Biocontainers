.. _backbone-label:

Antismash
==============================

Introduction
~~~~~~~~
Antismash allows the rapid genome-wide identification, annotation and analysis of secondary metabolite biosynthesis gene clusters in bacterial and fungal genomes.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/antismash 
| Home page: https://docs.antismash.secondarymetabolites.org

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
    - 5.1.2, 6.0.1, 6.1.0
  * - BELL
    - 5.1.2, 6.0.1, 6.1.0, 8.0.1
  * - GAUTSCHI
    - 5.1.2, 6.0.1, 6.1.0
  * - NEGISHI
    - 5.1.2, 6.0.1, 6.1.0, 8.0.1
  * - SCHOLAR
    - 5.1.2, 6.0.1, 6.1.0

Commands
~~~~~~~
- antismash

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load antismash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run antismash on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=antismash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers antismash
