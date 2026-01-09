.. _backbone-label:

Alfred
==============================

Introduction
~~~~~~~~
``Alfred`` is an efficient and versatile command-line application that computes multi-sample quality control metrics in a read-group aware manner. 

| For more information, please check its website: https://biocontainers.pro/tools/alfred and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.2.5, 0.2.6
  * - BELL
    - 0.2.5, 0.2.6
  * - GAUTSCHI
    - 0.2.5, 0.2.6
  * - NEGISHI
    - 0.2.5, 0.2.6
  * - SCHOLAR
    - 0.2.5, 0.2.6

Commands
~~~~~~~
- alfred

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load alfred

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Alfred on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=alfred
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alfred

    alfred qc -r genome.fasta -o qc.tsv.gz sorted.bam
.. _Github: https://github.com/tobiasrausch/alfred
