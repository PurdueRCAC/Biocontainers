.. _backbone-label:

Vcf2phylip
==============================

Introduction
~~~~~~~~
vcf2phylip is a tool to convert SNPs in VCF format to PHYLIP, NEXUS, binary NEXUS, or FASTA alignments for phylogenetic analysis.


| For more information, please check:
| Home page: https://github.com/edgardomortiz/vcf2phylip

Versions
~~~~~~~~
- 2.8

Commands
~~~~~~~
- vcf2phylip.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vcf2phylip

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vcf2phylip on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vcf2phylip
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vcf2phylip

    vcf2phylip --input myfile.vcf
