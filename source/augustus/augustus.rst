.. _backbone-label:

AUGUSTUS
==============================

Introduction
~~~~~~~
``AUGUSTUS`` is  a program that predicts genes in eukaryotic genomic sequences. For more information, please check its website: https://bioinf.uni-greifswald.de/augustus/. 

Versions
~~~~~~~~
- 3.4.0

Commands
~~~~~~  
- aln2wig  
- augustus  
- bam2wig
- bam2wig-dist
- consensusFinder
- curve2hints
- etraining
- fastBlockSearch
- filterBam
- getSeq
- getSeq-dist
- homGeneMapping
- joingenes
- prepareAlign

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load augustus/3.4.0

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run AUGUSTUS on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=AUGUSTUS
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers augustus/3.4.0 
 
    augustus --species=botrytis_cinerea genome.fasta > annotation.gff 

     
    

    
