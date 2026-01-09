.. _backbone-label:

Skewer
==============================

Introduction
~~~~~~~~
``Skewer`` is a fast and accurate adapter trimmer for paired-end reads. 

| For more information, please check its website: https://biocontainers.pro/tools/skewer and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.2.2
  * - BELL
    - 0.2.2
  * - GAUTSCHI
    - 0.2.2
  * - NEGISHI
    - 0.2.2
  * - SCHOLAR
    - 0.2.2

Commands
~~~~~~~
- skewer

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load skewer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Skewer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=skewer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers skewer

    skewer -l 50 -m pe -o skewerQ30 --mean-quality 30 \
         --end-quality 30 -t 10 -x TruSeq3-PE.fa \
         input_1.fastq input_2.fastq
.. _Github: https://github.com/relipmoc/skewer.git
