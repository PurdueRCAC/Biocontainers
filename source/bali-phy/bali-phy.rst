.. _backbone-label:

Bali-phy
==============================

Introduction
~~~~~~~~
Bali-phy is a tool for bayesian co-estimation of phylogenies and multiple alignments via MCMC.

| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/bali-phy 
| Home page: https://github.com/bredelings/BAli-Phy

Versions
~~~~~~~~
- 3.6.0

Commands
~~~~~~~
- bali-phy

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bali-phy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bali-phy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bali-phy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bali-phy

    bali-phy examples/sequences/ITS/ITS1.fasta 5.8S.fasta ITS2.fasta --test
    bali-phy examples/sequences/5S-rRNA/5d-clustalw.fasta -S gtr+Rates.gamma[4]+inv -n 5d-free
