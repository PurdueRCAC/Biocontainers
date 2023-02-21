.. _backbone-label:

Isoquant
==============================

Introduction
~~~~~~~~
IsoQuant is a tool for the genome-based analysis of long RNA reads, such as PacBio or Oxford Nanopores. IsoQuant allows to reconstruct and quantify transcript models with high precision and decent recall. If the reference annotation is given, IsoQuant also assigns reads to the annotated isoforms based on their intron and exon structure. IsoQuant further performs annotated gene, isoform, exon and intron quantification. If reads are grouped (e.g. according to cell type), counts are reported according to the provided grouping.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/isoquant 
| Home page: https://github.com/ablab/IsoQuant

Versions
~~~~~~~~
- 3.1.2

Commands
~~~~~~~
- isoquant.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load isoquant

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run isoquant on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=isoquant
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers isoquant

    isoquant.py --reference chr9.4M.fa.gz \
        --genedb chr9.4M.gtf.gz \
        --fastq  chr9.4M.ont.sim.fq.gz \
        --data_type nanopore -o test_ont
