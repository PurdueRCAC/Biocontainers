.. _backbone-label:

Phg
==============================

Introduction
~~~~~~~~
Practical Haplotype Graph (PHG) is a general, graph-based, computational framework that can be used with a variety of skim sequencing methods to infer high-density genotypes directly from low-coverage sequence.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/maizegenetics/phg 
| Home page: https://www.maizegenetics.net/phg

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.0
  * - BELL
    - 1.0
  * - GAUTSCHI
    - 1.0
  * - NEGISHI
    - 1.0
  * - SCHOLAR
    - 1.0

Commands
~~~~~~~
- CreateConsensi.sh
- CreateHaplotypes.sh
- CreateReferenceIntervals.sh
- CreateSmallDataSet.sh
- CreateValidIntervalsFile.sh
- IndexPangenome.sh
- LoadAssemblyAnchors.sh
- LoadGenomeIntervals.sh
- ParallelAssemblyAnchorsLoad.sh
- RunLiquibaseUpdates.sh
- CreateHaplotypesFromBAM.groovy
- CreateHaplotypesFromFastq.groovy
- CreateHaplotypesFromGVCF.groovy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load phg

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run phg on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=phg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers phg
