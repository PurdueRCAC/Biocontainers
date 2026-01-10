.. _backbone-label:

Augustus
==============================

Introduction
~~~~~~~~
Augustus is a program that predicts genes in eukaryotic genomic sequences.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/augustus 
| Home page: http://bioinf.uni-greifswald.de/augustus/

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
    - 3.4.0, 3.5.0
  * - BELL
    - 3.4.0, 3.5.0
  * - GAUTSCHI
    - 3.4.0, 3.5.0
  * - NEGISHI
    - 3.4.0, 3.5.0
  * - SCHOLAR
    - 3.4.0, 3.5.0

Commands
~~~~~~~
- aln2wig
- augustus
- bam2hints
- bam2wig
- bam2wig-dist
- consensusFinder
- curve2hints
- etraining
- fastBlockSearch
- filterBam
- getSeq
- getSeq-dist
- homGeneMapping
- joingenes
- prepareAlign

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load augustus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run augustus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=augustus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers augustus
