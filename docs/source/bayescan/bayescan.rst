.. _backbone-label:

Bayescan
==============================

Introduction
~~~~~~~~
BayeScan aims at identifying candidate loci under natural selection from genetic data, using differences in allele frequencies between populations.


| For more information, please check:
| Home page: http://cmpg.unibe.ch/software/BayeScan/

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.1
  * - BELL
    - 2.1
  * - GAUTSCHI
    - 2.1
  * - NEGISHI
    - 2.1
  * - SCHOLAR
    - 2.1

Commands
~~~~~~~
- bayescan

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bayescan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bayescan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bayescan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bayescan
