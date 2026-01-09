.. _backbone-label:

Amptk
==============================

Introduction
~~~~~~~~
``Amptk`` is a series of scripts to process NGS amplicon data using USEARCH and VSEARCH, it can also be used to process any NGS amplicon data and includes databases setup for analysis of fungal ITS, fungal LSU, bacterial 16S, and insect COI amplicons. 

| For more information, please check its website: https://biocontainers.pro/tools/amptk and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.5.4
  * - BELL
    - 1.5.4
  * - GAUTSCHI
    - 1.5.4
  * - NEGISHI
    - 1.5.4
  * - SCHOLAR
    - 1.5.4

Commands
~~~~~~~
- amptk

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load amptk

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Amptk on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=amptk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers amptk

    amptk illumina -i test_data/illumina_test_data -o miseq -f fITS7 -r ITS4  --cpus 4

    
.. _Github: https://github.com/nextgenusfs/amptk
