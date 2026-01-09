.. _backbone-label:

Purge_haplotigs
==============================

Introduction
~~~~~~~~
A simple pipeline for reassigning primary contigs that should be labelled as haplotigs.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/purge_haplotigs 
| Home page: https://bitbucket.org/mroachawri/purge_haplotigs/src/master/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.1.3
  * - NEGISHI
    - 1.1.3

Commands
~~~~~~~
- purge_haplotigs

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load purge_haplotigs

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run purge_haplotigs on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=purge_haplotigs
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers purge_haplotigs
