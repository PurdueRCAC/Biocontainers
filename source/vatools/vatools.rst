.. _backbone-label:

Vatools
==============================

Introduction
~~~~~~~~
VAtools is a python package that includes several tools to annotate VCF files with data from other tools.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/griffithlab/vatools 
| Home page: https://vatools.readthedocs.io/en/latest/

Versions
~~~~~~~~
- 5.0.1

Commands
~~~~~~~
- ref-transcript-mismatch-reporter
- transform-split-values
- vcf-expression-annotator
- vcf-genotype-annotator
- vcf-info-annotator
- vcf-readcount-annotator
- vep-annotation-reporter

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load vatools

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run vatools on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=vatools
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers vatools

    vcf-readcount-annotator <input_vcf> <snv_bam_readcount_file> <DNA| RNA> \
                -s <sample_name> -t snv -o <snv_annotated_vcf>
