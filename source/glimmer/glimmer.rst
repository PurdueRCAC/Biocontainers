.. _backbone-label:

Glimmer
==============================

Introduction
~~~~~~~~
``Glimmer`` is a system for finding genes in microbial DNA, especially the genomes of bacteria, archaea, and viruses. | For more information, please check its website: https://biocontainers.pro/tools/glimmer and its home page: http://ccb.jhu.edu/software/glimmer/index.shtml.

Versions
~~~~~~~~
- 3.02

Commands
~~~~~~~
- anomaly
- build-fixed
- build-icm
- entropy-profile
- entropy-score
- extract
- g3-from-scratch.csh
- g3-from-training.csh
- g3-iterated.csh
- get-motif-counts.awk
- glim-diff.awk
- glimmer3
- long-orfs
- match-list-col.awk
- multi-extract
- not-acgt.awk
- score-fixed
- start-codon-distrib
- test
- uncovered
- upstream-coords.awk
- window-acgt

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load glimmer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Glimmer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=glimmer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers glimmer

    long-orfs -n -t 1.15 scaffolds.fasta run1.longorfs
    extract -t scaffolds.fasta run1.longorfs > run1.train
    build-icm -r run1.icm < run1.train
    glimmer3 scaffolds.fasta run1.icm cm 
