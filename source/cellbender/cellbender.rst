.. _backbone-label:

Cellbender
==============================

Introduction
~~~~~~~~
``Cellbender`` is a software package for eliminating technical artifacts from high-throughput single-cell RNA sequencing (scRNA-seq) data. 

| For more information, please check its website: https://biocontainers.pro/tools/cellbender and its home page on `Github`_.

Versions
~~~~~~~~
- 0.2.0

Commands
~~~~~~~
- cellbender

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cellbender

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cellbender on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=cellbender
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellbender

    cellbender remove-background \
                 --input cellranger/test_count/run_count_1kpbmcs/outs/raw_feature_bc_matrix.h5 \
                 --output output_cpu.h5 \
                 --expected-cells 1000 \
                 --total-droplets-included 20000 \
                 --fpr 0.01 \
                 --epochs 150

   
.. _Github: https://github.com/broadinstitute/CellBender
