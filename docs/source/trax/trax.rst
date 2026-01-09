.. _backbone-label:

tRAX
==============================

Introduction
~~~~~~~~
``tRAX`` (tRNA Analysis of eXpression) is a software package built for in-depth analyses of tRNA-derived small RNAs (tDRs), mature tRNAs, and inference of RNA modifications from high-throughput small RNA sequencing data. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/ucsclowelab/trax and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.0.0
  * - BELL
    - 1.0.0
  * - GAUTSCHI
    - 1.0.0
  * - NEGISHI
    - 1.0.0
  * - SCHOLAR
    - 1.0.0

Commands
~~~~~~~
- TestRun.bash
- quickdb.bash
- maketrnadb.py
- trimadapters.py
- processamples.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trax

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run tRAX on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=trax
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers trax

.. _Github: https://github.com/UCSC-LoweLab/tRAX
