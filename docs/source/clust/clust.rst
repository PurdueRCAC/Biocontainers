.. _backbone-label:

Clust
==============================

Introduction
~~~~~~~~
Clust is a fully automated method for identification of clusters (groups) of genes that are consistently co-expressed (well-correlated) in one or more heterogeneous datasets from one or multiple species.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/clust 
| Home page: https://github.com/baselabujamous/clust

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.17.0

Commands
~~~~~~~
- clust

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clust

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clust on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clust
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clust

