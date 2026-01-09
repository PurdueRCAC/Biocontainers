.. _backbone-label:

Weblogo
==============================

Introduction
~~~~~~~~
``Weblogo`` is a web based application designed to make the generation of sequence logos as easy and painless as possible. 

| For more information, please check its website: https://biocontainers.pro/tools/weblogo and its home page: http://weblogo.threeplusone.com.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.7.8
  * - BELL
    - 3.7.8
  * - GAUTSCHI
    - 3.7.8
  * - NEGISHI
    - 3.7.8
  * - SCHOLAR
    - 3.7.8

Commands
~~~~~~~
- weblogo

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load weblogo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Weblogo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=weblogo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers weblogo
  
    weblogo --resolution 600 --format PNG \
         <seq.fasta >logo.png
