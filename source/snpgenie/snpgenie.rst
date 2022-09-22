.. _backbone-label:

Snpgenie
==============================

Introduction
~~~~~~~~
``Snpgenie`` is a collection of Perl scripts for estimating πN/πS, dN/dS, and gene diversity from next-generation sequencing (NGS) single-nucleotide polymorphism (SNP) variant data. For more information, please check its website: https://biocontainers.pro/tools/snpgenie and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0

Commands
~~~~~~~
- fasta2revcom.pl
- gtf2revcom.pl
- snpgenie.pl
- snpgenie_between_group.pl
- snpgenie_between_group_processor.pl
- snpgenie_within_group.pl
- snpgenie_within_group_processor.pl
- vcf2revcom.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load snpgenie

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Snpgenie on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=snpgenie
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers snpgenie

    snpgenie.pl --minfreq=0.01 --snpreport=CLC_SNP_EXAMPLE.txt \
        --fastafile=REFERENCE_EXAMPLE.fasta --gtffile=CDS_EXAMPLE.gtf
.. _Github: https://github.com/chasewnelson/SNPGenie
