.. _backbone-label:

Bamgineer
==============================

Introduction
~~~~~~~~
``Bamgineer`` is a tool that can be used to introduce user-defined haplotype-phased allele-specific copy number variations (CNV) into an existing Binary Alignment Mapping (BAM) file with demonstrated applicability to simulate somatic cancer CNVs in phased whole-genome sequencing datsets. | For more information, please check its | Docker hub: https://hub.docker.com/r/suluxan/bamgineer-v2 and its home page on `Github`_.

Versions
~~~~~~~~
- 1.1

Commands
~~~~~~~
- simulate.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bamgineer

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bamgineer on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bamgineer
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bamgineer

    simulate.py -config inputs/config.cfg \
                -splitbamdir splitbams \
                -cnv_bed inputs/cnv.bed \
                -vcf inputs/normal_het.vcf \
                -exons inputs/exons.bed \
                -outbam tumour.bam \
                -results outputs \
                -cancertype LUAC1 
    
.. _Github: https://github.com/pughlab/bamgineer
