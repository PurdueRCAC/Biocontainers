.. _backbone-label:

Sicer
==============================

Introduction
~~~~~~~~
``Sicer`` is a clustering approach for identification of enriched domains from histone modification ChIP-Seq data. 

| For more information, please check its website: https://biocontainers.pro/tools/sicer and its home page: http://home.gwu.edu/~wpeng/Software.htm.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.1
  * - BELL
    - 1.1
  * - GAUTSCHI
    - 1.1
  * - NEGISHI
    - 1.1
  * - SCHOLAR
    - 1.1

Commands
~~~~~~~
- SICER-df-rb.sh
- SICER-df.sh
- SICER-rb.sh
- SICER.sh

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load sicer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Sicer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sicer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sicer

    SICER.sh ./ test.bed control.bed . hg18 1 200 150 0.74 600 .01

    SICER-rb.sh ./ test.bed . hg18 1 200 150 0.74 400 100
