.. _backbone-label:

Lima
==============================

Introduction
~~~~~~~~
``Lima`` is the standard tool to identify barcode and primer sequences in PacBio single-molecule sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/lima and its home page: https://lima.how.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 2.2.0
  * - BELL
    - 2.2.0
  * - GAUTSCHI
    - 2.2.0
  * - NEGISHI
    - 2.2.0
  * - SCHOLAR
    - 2.2.0

Commands
~~~~~~~
- lima

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load lima

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Lima on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=lima
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lima

    lima --version
    lima --isoseq --dump-clips \
        --peek-guess -j 12 \
        alz.ccs.bam primers.fasta \
        alz.demult.bam
