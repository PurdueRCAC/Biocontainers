.. _backbone-label:

Bali-phy
==============================

Introduction
~~~~~~~~
Bali-phy is a tool for bayesian co-estimation of phylogenies and multiple alignments via MCMC.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bali-phy 
| Home page: https://github.com/bredelings/BAli-Phy

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
    - 3.6.0
  * - BELL
    - 3.6.0
  * - GAUTSCHI
    - 3.6.0
  * - NEGISHI
    - 3.6.0
  * - SCHOLAR
    - 3.6.0

Commands
~~~~~~~
- bali-phy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bali-phy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bali-phy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bali-phy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bali-phy
