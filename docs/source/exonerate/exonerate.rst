.. _backbone-label:

Exonerate
==============================

Introduction
~~~~~~~~
``Exonerate`` is a generic tool for pairwise sequence comparison/alignment. 

| For more information, please check its home page: https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.4.0
  * - BELL
    - 2.4.0
  * - GAUTSCHI
    - 2.4.0
  * - NEGISHI
    - 2.4.0
  * - SCHOLAR
    - 2.4.0

Commands
~~~~~~~
- exonerate

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load exonerate

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Exonerate on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=exonerate
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers exonerate

    exonerate  -m genome2genome  cms.fasta cmm.fasta > cm_vs_cs.out
