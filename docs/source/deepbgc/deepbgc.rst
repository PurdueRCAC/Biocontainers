.. _backbone-label:

Deepbgc
==============================

Introduction
~~~~~~~~
``Deepbgc`` is a tool for BGC detection and classification using deep learning. 

| For more information, please check its website: https://biocontainers.pro/tools/deepbgc and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.1.26, 0.1.30
  * - BELL
    - 0.1.26, 0.1.30
  * - GAUTSCHI
    - 0.1.26, 0.1.30
  * - NEGISHI
    - 0.1.26, 0.1.30
  * - SCHOLAR
    - 0.1.26, 0.1.30

Commands
~~~~~~~
- deepbgc

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load deepbgc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Deepbgc on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepbgc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepbgc

    export DEEPBGC_DOWNLOADS_DIR=$PWD
    deepbgc download
    deepbgc pipeline genome.fa  -o output

.. _Github: https://github.com/Merck/deepbgc
