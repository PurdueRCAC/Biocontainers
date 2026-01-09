.. _backbone-label:

Dropest
==============================

Introduction
~~~~~~~~
``Dropest`` is a pipeline for initial analysis of droplet-based single-cell RNA-seq data. 

| For more information, please check its website: https://biocontainers.pro/tools/dropest and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.8.6
  * - BELL
    - 0.8.6
  * - GAUTSCHI
    - 0.8.6
  * - NEGISHI
    - 0.8.6
  * - SCHOLAR
    - 0.8.6

Commands
~~~~~~~
- dropest
- droptag
- dropReport.Rsc
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load dropest

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Dropest on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=dropest
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers dropest

    dropest -f -c 10x.xml  -C 1200 neurons_900_possorted_genome_bam.bam
.. _Github: https://github.com/kharchenkolab/dropEst
