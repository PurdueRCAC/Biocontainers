.. _backbone-label:

Glimmerhmm
==============================

Introduction
~~~~~~~~
``Glimmerhmm`` is a new gene finder based on a Generalized Hidden Markov Model (GHMM). 

| For more information, please check its website: https://biocontainers.pro/tools/glimmerhmm and its home page: https://ccb.jhu.edu/software/glimmerhmm/.

Versions
~~~~~~~~
- 3.0.4

Commands
~~~~~~~
- glimmerhmm
- glimmhmm.pl
- trainGlimmerHMM

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load glimmerhmm

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Glimmerhmm on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=glimmerhmm
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers glimmerhmm

    trainGlimmerHMM Asperg.fasta Asperg.cds -d Asperg
    glimmerhmm Asperg.fasta -d Asperg -o Asperg_glimmerhmm_out
