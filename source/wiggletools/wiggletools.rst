.. _backbone-label:

Wiggletools
==============================

Introduction
~~~~~~~~
The WiggleTools package allows genomewide data files to be manipulated as numerical functions, equipped with all the standard functional analysis operators (sum, product, product by a scalar, comparators), and derived statistics (mean, median, variance, stddev, t-test, Wilcoxon's rank sum test, etc).

| For more information, please check:
| Docker hub: https://hub.docker.com/r/ensemblorg/wiggletools 
| Home page: https://github.com/Ensembl/WiggleTools

Versions
~~~~~~~~
- 1.2.11

Commands
~~~~~~~
- wiggletools

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load wiggletools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run wiggletools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=wiggletools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers wiggletools

    wiggletools test/fixedStep.wig
    wiggletools test/fixedStep.bw
    wiggletools test/bedfile.bg
    wiggletools test/overlapping.bed
    wiggletools test/bam.bam
    wiggletools test/cram.cram
    wiggletools test/vcf.vcf
    wiggletools test/bcf.bcf
