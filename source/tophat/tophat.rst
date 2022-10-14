.. _backbone-label:

TopHat
==============================

Introduction
~~~~~~~~
``TopHat`` is a fast splice junction mapper for RNA-Seq reads. It aligns RNA-Seq reads to mammalian-sized genomes using the ultra high-throughput short read aligner Bowtie, and then analyzes the mapping results to identify splice junctions between exons. 

| For more information, please check its website: https://biocontainers.pro/tools/tophat and its home page: https://ccb.jhu.edu/software/tophat/index.shtml.

Versions
~~~~~~~~
- 2.1.1-py27

Commands
~~~~~~~
- tophat
- tophat2

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load tophat

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run TopHat on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=tophat
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tophat

    tophat -r 20 test_ref reads_1.fq reads_2.fq
