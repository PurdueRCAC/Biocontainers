.. _backbone-label:

Minialign
==============================

Introduction
~~~~~~~~
``Minialign`` is a little bit fast and moderately accurate nucleotide sequence alignment tool designed for PacBio and Nanopore long reads. 

| For more information, please check its website: https://biocontainers.pro/tools/minialign and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.5.3
  * - BELL
    - 0.5.3
  * - GAUTSCHI
    - 0.5.3
  * - NEGISHI
    - 0.5.3
  * - SCHOLAR
    - 0.5.3

Commands
~~~~~~~
- minialign

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load minialign

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Minialign on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=minialign
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers minialign

    minialign -d index.mai genome.fasta
    minialign -l index.mai input.fastq > out.sam
.. _Github: https://github.com/ocxtal/minialign
