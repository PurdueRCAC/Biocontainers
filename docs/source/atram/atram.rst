.. _backbone-label:  

aTRAM
============================== 

Introduction
~~~~~~~
``aTRAM`` (automated target restricted assembly method) is an iterative assembler that performs reference-guided local de novo assemblies using a variety of available methods. 

Detailed usage can be found here: https://bioinformaticshome.com/tools/wga/descriptions/aTRAM.html

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.4.3
  * - BELL
    - 2.4.3
  * - GAUTSCHI
    - 2.4.3
  * - NEGISHI
    - 2.4.3
  * - SCHOLAR
    - 2.4.3

Commands
~~~~~~
- atram.py
- atram_preprocessor.py
- atram_stitcher.py

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load atram/2.4.3

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run aTRAM on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=atram
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers atram/2.4.3a
    
    atram_preprocessor.py --blast-db=atram_db  \ 
                          --end-1=data/tutorial_end_1.fasta.gz \
                          --end-2=data/tutorial_end_2.fasta.gz \ 
                          --gzip
    atram.py --query=tutorial-query.pep.fasta  \
             --blast-db=atram_db \
             --output=output \
             --assembler=velvet






.. _R202: https://gtdb.ecogenomic.org 
