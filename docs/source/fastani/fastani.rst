.. _backbone-label:

FastANI
==============================

Introduction
~~~~~~~~
``FastANI`` is developed for fast alignment-free computation of whole-genome Average Nucleotide Identity (ANI). 

| For more information, please check its website: https://biocontainers.pro/tools/fastani and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.32, 1.33
  * - BELL
    - 1.32, 1.33
  * - GAUTSCHI
    - 1.32, 1.33
  * - NEGISHI
    - 1.32, 1.33
  * - SCHOLAR
    - 1.32, 1.33

Commands
~~~~~~~
- fastANI

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fastani

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run FastANI on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastani
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastani

    fastANI -q cmm.fasta -r cms.fasta -o cm_cs_out 

    fastANI -q cmm.fasta -r cms.fasta  --visualize -o cm_cs_visualize_out
    
.. _Github: https://github.com/ParBLiSS/FastANI
