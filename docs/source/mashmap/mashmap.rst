.. _backbone-label:

Mashmap
==============================

Introduction
~~~~~~~~
``Mashmap`` is a fast approximate aligner for long DNA sequences. 

| For more information, please check its website: https://biocontainers.pro/tools/mashmap and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.0-pl5321
  * - BELL
    - 2.0-pl5321
  * - GAUTSCHI
    - 2.0-pl5321
  * - NEGISHI
    - 2.0-pl5321
  * - SCHOLAR
    - 2.0-pl5321

Commands
~~~~~~~
- mashmap

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load mashmap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Mashmap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=mashmap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers mashmap

    mashmap -r ref.fasta -t 12 -q input.fasta
.. _Github: https://github.com/marbl/MashMap
