.. _backbone-label:

Mmseqs2
==============================

Introduction
~~~~~~~~
``Mmseqs2`` is a software suite to search and cluster huge protein and nucleotide sequence sets. 

| For more information, please check its website: https://biocontainers.pro/tools/mmseqs2 and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 13.45111, 14.7e284
  * - BELL
    - 13.45111, 14.7e284
  * - GAUTSCHI
    - 13.45111, 14.7e284
  * - NEGISHI
    - 13.45111, 14.7e284
  * - SCHOLAR
    - 13.45111, 14.7e284

Commands
~~~~~~~
- mmseqs

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mmseqs2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mmseqs2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=mmseqs2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mmseqs2

    mmseqs createdb examples/DB.fasta targetDB
    mmseqs createtaxdb targetDB tmp
    mmseqs createindex targetDB tmp
    mmseqs easy-taxonomy examples/QUERY.fasta targetDB alnRes tmp

.. _Github: https://github.com/soedinglab/MMseqs2
