.. _backbone-label:

Svist4get
==============================

Introduction
~~~~~~~~
Svist4get is a simple visualization tool for genomic tracks from sequencing experiments.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/svist4get 
| Home page: https://github.com/art-egorov/svist4get

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
    - 1.3.1.1
  * - BELL
    - 1.3.1.1
  * - GAUTSCHI
    - 1.3.1.1
  * - NEGISHI
    - 1.3.1.1

Commands
~~~~~~~
- svist4get

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load svist4get

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run svist4get on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=svist4get
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers svist4get
