.. _backbone-label:

Bismark
==============================

Introduction
~~~~~~~~
``Bismark`` is a tool to map bisulfite treated sequencing reads to a genome of interest and perform methylation calls in a single step. 

| For more information, please check its website: https://biocontainers.pro/tools/bismark and its home page on `Github`_.

Versions
~~~~~~~~
- 0.23.0
- 0.24.0

Commands
~~~~~~~
- bismark
- bam2nuc
- bismark2bedGraph
- bismark2report
- bismark2summary
- bismark_genome_preparation
- bismark_methylation_extractor
- copy_bismark_files_for_release.pl
- coverage2cytosine
- deduplicate_bismark
- filter_non_conversion
- methylation_consistency

Dependencies
~~~~~
``Bowtie v2.4.2``, ``Samtools v1.12``, ``HISAT2 v2.2.1`` were included in the container image. So users do not need to provide the dependency path in the bismark parameter.


Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bismark

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bismark on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=bismark
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bismark

    bismark_genome_preparation --bowtie2 data/ref_genome

    bismark --multicore 12 --genome data/ref_genome seq.fastq

.. _Github: https://github.com/FelixKrueger/Bismark
