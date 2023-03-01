.. _backbone-label:

Bcftools
==============================

Introduction
~~~~~~~~
``Bcftools`` is a program for variant calling and manipulating files in the Variant Call Format (VCF) and its binary counterpart BCF. 

| For more information, please check its website: https://biocontainers.pro/tools/bcftools and its home page on `Github`_.

Versions
~~~~~~~~
- 1.13
- 1.14

Commands
~~~~~~~
- bcftools
- color-chrs.pl
- guess-ploidy.py
- plot-roh.py
- plot-vcfstats
- run-roh.pl
- vcfutils.pl

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bcftools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bcftools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bcftools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bcftools

    bcftools query -f '%CHROM %POS %REF %ALT\n' file.bcf
    bcftools polysomy -v -o outdir/ file.vcf
       
    # Variant calling
    bcftools mpileup -f reference.fa alignments.bam | bcftools call -mv -Ob -o calls.bcf
   
.. _Github: https://samtools.github.io/bcftools/bcftools.html
