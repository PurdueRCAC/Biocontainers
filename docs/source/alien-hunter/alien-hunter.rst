.. _backbone-label:

Alien-hunter
==============================

Introduction
~~~~~~~~
``Alien-hunter`` is an application for the prediction of putative Horizontal Gene Transfer (HGT) events with the implementation of Interpolated Variable Order Motifs (IVOMs). 

| For more information, please check its website: https://biocontainers.pro/tools/alien-hunter and its home page: https://www.sanger.ac.uk/tool/alien-hunter/.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.7.7
  * - BELL
    - 1.7.7
  * - GAUTSCHI
    - 1.7.7
  * - NEGISHI
    - 1.7.7
  * - SCHOLAR
    - 1.7.7

Commands
~~~~~~~
- alien_hunter

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load alien_hunter

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Alien_hunter on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=alien_hunter
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers alien_hunter
     
    alien_hunter genome.fasta output
