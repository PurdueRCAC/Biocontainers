.. _backbone-label:

Pangolin
==============================

Introduction
~~~~~~~~
``Pangolin`` is a software package for assigning SARS-CoV-2 genome sequences to global lineages. 

| For more information, please check its website: https://biocontainers.pro/tools/pangolin and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 3.1.20, 4.0.6, 4.1.2, 4.1.3, 4.2
  * - BELL
    - 3.1.20, 4.0.6, 4.1.2, 4.1.3, 4.2
  * - GAUTSCHI
    - 3.1.20, 4.0.6, 4.1.2, 4.1.3, 4.2
  * - NEGISHI
    - 3.1.20, 4.0.6, 4.1.2, 4.1.3, 4.2
  * - SCHOLAR
    - 3.1.20, 4.0.6, 4.1.2, 4.1.3, 4.2

Commands
~~~~~~~
- pangolin

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load pangolin

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Pangolin on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=pangolin
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers pangolin

.. _Github: https://github.com/cov-lineages/pangolin
