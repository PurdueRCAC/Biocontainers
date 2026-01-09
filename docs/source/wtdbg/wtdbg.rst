.. _backbone-label:

Wtdbg2
==============================

Introduction
~~~~~~~~
``Wtdbg2`` is a de novo sequence assembler for long noisy reads produced by PacBio or Oxford Nanopore Technologies (ONT). 

| For more information, please check its website: https://biocontainers.pro/tools/wtdbg and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.5
  * - BELL
    - 2.5
  * - GAUTSCHI
    - 2.5
  * - NEGISHI
    - 2.5
  * - SCHOLAR
    - 2.5

Commands
~~~~~~~
- wtdbg-cns
- wtdbg2
- wtpoa-cns

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load wtdbg

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Wtdbg2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=wtdbg
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers wtdbg

    wtpoa-cns -t 24 -i dbg.ctg.lay.gz -fo dbg.ctg.fa
.. _Github: https://github.com/ruanjue/wtdbg2
