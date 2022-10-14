.. _backbone-label:

Last
==============================

Introduction
~~~~~~~~
``Last`` is used to find & align related regions of sequences. 
| For more information, please check its website: https://biocontainers.pro/tools/last and its home page on `Gitlab`_.

Versions
~~~~~~~~
- 1268
- 1356
- 1411

Commands
~~~~~~~
- last-dotplot
- last-map-probs
- last-merge-batches
- last-pair-probs
- last-postmask
- last-split
- last-split5
- last-train
- lastal
- lastal5
- lastdb
- lastdb5

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load last

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Last on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=last
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers last

    lastdb humdb humanMito.fa
    lastal humdb fuguMito.fa > myalns.maf
.. _Gitlab: https://gitlab.com/mcfrith/last
