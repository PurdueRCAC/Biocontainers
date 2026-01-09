.. _backbone-label:

Psmc
==============================

Introduction
~~~~~~~~
PSMC infers population size history from a diploid sequence using the Pairwise Sequentially Markovian Coalescent (PSMC) model


| For more information, please check:
| BioContainers: 
| Home page: https://github.com/lh3/psmc/tree/master

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.6.5
  * - BELL
    - 0.6.5
  * - NEGISHI
    - 0.6.5

Commands
~~~~~~~
- psmc
- avg.pl
- calD
- cntcpg
- ctime_plot.pl
- dec2ctime.pl
- decode2bed.pl
- fq2psmcfa
- history2ms.pl
- ms2psmcfa.pl
- mutDiff
- pcnt_bezier.lua
- psmc2history.pl
- psmc_plot.pl
- psmc_trunc.pl
- splitfa

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load psmc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run psmc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=psmc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers psmc
