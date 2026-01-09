.. _backbone-label:

Dbg2olc
==============================

Introduction
~~~~~~~~
Dbg2olc is used for efficient assembly of large genomes using long erroneous reads of the third generation sequencing technologies.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/dbg2olc 
| Home page: https://github.com/yechengxi/DBG2OLC

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 20180222
- 20200723

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

To run dbg2olc on our clusters::

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

