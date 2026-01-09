.. _backbone-label:

Dbg2olc
==============================

Introduction
~~~~~~~~
``Dbg2olc`` is used for efficient assembly of large genomes using long erroneous reads of the third generation sequencing technologies. 

| For more information, please check its website: https://biocontainers.pro/tools/dbg2olc and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 20180222, 20200723
  * - BELL
    - 20180222, 20200723
  * - GAUTSCHI
    - 20180222, 20200723
  * - NEGISHI
    - 20180222, 20200723
  * - SCHOLAR
    - 20180222, 20200723

Commands
~~~~~~~
- AssemblyStatistics
- DBG2OLC
- RunSparcConsensus.txt
- SelectLongestReads
- SeqIO.py
- Sparc
- SparseAssembler
- split_and_run_sparc.sh
- split_and_run_sparc.sh.bak
- split_reads_by_backbone.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load dbg2olc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Dbg2olc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=dbg2olc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dbg2olc

    SelectLongestReads sum 600000000 longest 0 o TEST.fq f SRR1976948.abundtrim.subset.pe.fq
.. _Github: https://github.com/yechengxi/DBG2OLC
