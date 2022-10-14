.. _backbone-label:

Clever-toolkit
==============================

Introduction
~~~~~~~~
Clever-toolkit is a collection of tools to discover and genotype structural variations in genomes from paired-end sequencing reads. The main software is written in C++ with some auxiliary scripts in Python.
|For more information, please check:
|BioContainers: https://biocontainers.pro/tools/clever-toolkit 
|Home page: https://bitbucket.org/tobiasmarschall/clever-toolkit/src/master/

Versions
~~~~~~~~
- 2.4-py37

Commands
~~~~~~~
- clever
- laser
- bam-to-alignment-priors
- split-priors-by-chromosome
- clever-core
- postprocess-predictions
- evaluate-sv-predictions
- split-reads
- laser-core
- laser-recalibrate
- genotyper
- insert-length-histogram
- add-score-tags-to-bam
- bam2fastq
- remove-redundant-variations
- precompute-distributions
- extract-bad-reads
- filter-variations
- merge-to-vcf
- multiline-to-xa
- filter-bam
- read-group-stats

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clever-toolkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clever-toolkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clever-toolkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clever-toolkit

    cat mapped.bam | bam2fastq output_1.fq output_2.fq
