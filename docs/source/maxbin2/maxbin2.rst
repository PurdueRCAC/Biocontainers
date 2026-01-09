.. _backbone-label:

Maxbin2
==============================

Introduction
~~~~~~~~
Maxbin2 is a software for binning assembled metagenomic sequences based on an Expectation-Maximization algorithm.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/nanozoo/maxbin2 
| Home page: https://sourceforge.net/projects/maxbin2/

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.2.7
  * - BELL
    - 2.2.7
  * - GAUTSCHI
    - 2.2.7
  * - NEGISHI
    - 2.2.7
  * - SCHOLAR
    - 2.2.7

Commands
~~~~~~~
- run_MaxBin.pl
- run_FragGeneScan.pl

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load maxbin2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run maxbin2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=maxbin2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers maxbin2

    run_MaxBin.pl -contig subset_assembly.fa \
         -abund_list abundance.list -max_iteration 5 -out mbin
