.. _backbone-label:

Velvet
==============================

Introduction
~~~~~~~~
``Velvet`` is a sequence assembler for very short reads. 

| For more information, please check its website: https://biocontainers.pro/tools/velvet and its home page: https://www.ebi.ac.uk/~zerbino/velvet/.

Versions
~~~~~~~~
- 1.2.10

Commands
~~~~~~~
- velveth
- velvetg

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load trimmomatic

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Velvet on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=velvet
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers velvet
 
    velveth output_directory 21 -fasta -short solexa1.fa solexa2.fa solexa3.fa -long capillary.fa
    velvetg output_directory -cov_cutoff 4
