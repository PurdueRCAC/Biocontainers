.. _backbone-label:

Plink
==============================

Introduction
~~~~~~~~
``Plink`` is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner. 

| For more information, please check its website: https://biocontainers.pro/tools/plink and its home page: https://zzz.bwh.harvard.edu/plink/.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 1.90b6.21
  * - BELL
    - 1.90b6.21
  * - GAUTSCHI
    - 1.90b6.21
  * - NEGISHI
    - 1.90b6.21
  * - SCHOLAR
    - 1.90b6.21

Commands
~~~~~~~
- plink
- prettify

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load plink

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Plink on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=plink
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers plink

    plink --file toy --freq --out toy_analysis
