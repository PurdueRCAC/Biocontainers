.. _backbone-label:

Gemma
==============================

Introduction
~~~~~~~~
``Gemma`` is a software toolkit for fast application of linear mixed models (LMMs) and related models to genome-wide association studies (GWAS) and other large-scale data sets. 

| For more information, please check its website: https://biocontainers.pro/tools/gemma and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.98.3
  * - BELL
    - 0.98.3
  * - GAUTSCHI
    - 0.98.3
  * - NEGISHI
    - 0.98.3
  * - SCHOLAR
    - 0.98.3

Commands
~~~~~~~
- gemma

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load gemma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Gemma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gemma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gemma

    gemma -g ./example/mouse_hs1940.geno.txt.gz -p ./example/mouse_hs1940.pheno.txt \
        -gk -o mouse_hs1940

    gemma -g ./example/mouse_hs1940.geno.txt.gz \
        -p ./example/mouse_hs1940.pheno.txt -n 1 -a ./example/mouse_hs1940.anno.txt \
        -k ./output/mouse_hs1940.cXX.txt -lmm -o mouse_hs1940_CD8_lmm


.. _Github: https://github.com/genetics-statistics/GEMMA
