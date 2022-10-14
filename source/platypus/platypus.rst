.. _backbone-label:

Platypus
==============================

Introduction
~~~~~~~~
``Platypus`` is a tool designed for efficient and accurate variant-detection in high-throughput sequencing data. 

| For more information, please check its website: https://biocontainers.pro/tools/platypus and its home page: https://www.well.ox.ac.uk/research/research-groups/lunter-group/lunter-group/platypus-a-haplotype-based-variant-caller-for-next-generation-sequence-data.

Versions
~~~~~~~~
- 0.8.1

Commands
~~~~~~~
- platypus

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load platypus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Platypus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=platypus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers platypus
