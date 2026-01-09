.. _backbone-label:

Sourmash
==============================

Introduction
~~~~~~~~
``Sourmash`` is a tool for quickly search, compare, and analyze genomic and metagenomic data sets. 

| For more information, please check its website: https://biocontainers.pro/tools/sourmash and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.3.0, 4.5.0
  * - BELL
    - 4.3.0, 4.5.0
  * - GAUTSCHI
    - 4.3.0, 4.5.0
  * - NEGISHI
    - 4.3.0, 4.5.0
  * - SCHOLAR
    - 4.3.0, 4.5.0

Commands
~~~~~~~
- sourmash

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load sourmash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Sourmash on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sourmash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sourmash

    sourmash sketch dna -p k=31 *.fna.gz
    sourmash compare *.sig -o cmp.dist
    sourmash plot cmp.dist --labels
.. _Github: https://github.com/sourmash-bio/sourmash
