.. _backbone-label:  

OrthoFinder
============================== 

Introduction
~~~~~~~
``OrthoFinder``: phylogenetic orthology inference for comparative genomics

Detailed usage can be found here: https://github.com/davidemms/OrthoFinder

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 2.5.2, 2.5.4, 2.5.5
  * - BELL
    - 2.5.2, 2.5.4, 2.5.5
  * - GAUTSCHI
    - 2.5.2, 2.5.4, 2.5.5
  * - NEGISHI
    - 2.5.2, 2.5.4, 2.5.5
  * - SCHOLAR
    - 2.5.2, 2.5.4, 2.5.5

Commands
~~~~~~
- orthofinder

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load orthofinder/2.5.4 

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run orthofinder on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=orthofinder
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers orthofinder/2.5.4
    
    orthofinder -t 24 -f InputData -o output
