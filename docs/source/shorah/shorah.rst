.. _backbone-label:

Shorah
==============================

Introduction
~~~~~~~~
``Shorah`` is an open source project for the analysis of next generation sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/shorah and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.99.2
  * - BELL
    - 1.99.2
  * - GAUTSCHI
    - 1.99.2
  * - NEGISHI
    - 1.99.2
  * - SCHOLAR
    - 1.99.2

Commands
~~~~~~~
- shorah
- b2w
- diri_sampler
- fil

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load shorah

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Shorah on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=shorah
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers shorah

    shorah amplicon -b ampli_sorted.bam -f reference.fasta
    shorah shotgun -b test_aln.cram -f test_ref.fasta
    shorah shotgun -a 0.1 -w 42 -x 100000 -p 0.9 -c 0 -r REF:42-272 -R 42 -b test_aln.cram -f ref.fasta
.. _Github: https://github.com/cbg-ethz/shorah
