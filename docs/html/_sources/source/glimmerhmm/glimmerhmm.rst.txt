.. _backbone-label:

Glimmerhmm
==============================

Introduction
~~~~~~~~
Glimmerhmm is a new gene finder based on a Generalized Hidden Markov Model (GHMM).


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/glimmerhmm 
| Home page: https://ccb.jhu.edu/software/glimmerhmm/

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
    - 3.0.4
  * - BELL
    - 3.0.4
  * - GAUTSCHI
    - 3.0.4
  * - NEGISHI
    - 3.0.4
  * - SCHOLAR
    - 3.0.4

Commands
~~~~~~~
- glimmerhmm
- glimmhmm.pl
- trainGlimmerHMM

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load glimmerhmm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run glimmerhmm on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=glimmerhmm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers glimmerhmm
