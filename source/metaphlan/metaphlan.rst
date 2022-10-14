.. _backbone-label:

MetaPhlAn 3
==============================

Introduction
~~~~~~~
``MetaPhlAn`` (Metagenomic Phylogenetic Analysis) is a computational tool for profiling the composition of microbial communities from metagenomic shotgun sequencing data. MetaPhlAn relies on unique clade-specific marker genes identified from ~17,000 reference genomes (~13,500 bacterial and archaeal, ~3,500 viral, and ~110 eukaryotic), allowing:  

- up to 25,000 reads-per-second (on one CPU) analysis speed (orders of magnitude faster compared to existing methods);
- unambiguous taxonomic assignments as the MetaPhlAn markers are clade-specific;
- accurate estimation of organismal relative abundance (in terms of number of cells rather than fraction of reads);
- species-level resolution for bacteria, archaea, eukaryotes and viruses;
- extensive validation of the profiling accuracy on several synthetic datasets and on thousands of real metagenomes.



| For more information, please check its user guide at: https://huttenhower.sph.harvard.edu/metaphlan/

Versions
~~~~~~~~
- 3.0.14
- 3.0.9

Commands
~~~~~~  
metaphlan


Database  
~~~~~~
The lastest version of database(mpa_v30) has been downloaded and built in ``/depot/itap/datasets/metaphlan/``.

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load metaphlan/3.0.14  

Example job
~~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run MetaPhlAn on our cluster::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=MetaPhlAn
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers metaphlan/3.0.14
    
    DATABASE=/depot/itap/datasets/metaphlan/
    metaphlan SRR11234553_1.fastq,SRR11234553_2.fastq --input_type fastq --nproc 24 -o profiled_metagenome.txt --bowtie2db $DATABASE  --bowtie2out metagenome.bowtie2.bz2
