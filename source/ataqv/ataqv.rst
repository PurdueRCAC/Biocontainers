.. _backbone-label:

Ataqv
==============================

Introduction
~~~~~~~~
``Ataqv`` is a toolkit for measuring and comparing ATAC-seq results, made in the Parker lab at the University of Michigan. 

| For more information, please check its website: https://biocontainers.pro/tools/ataqv and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3.0-py39

Commands
~~~~~~~
- ataqv

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load ataqv

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Ataqv on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ataqv
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ataqv

    ataqv --peak-file sample_1_peaks.broadPeak \
        --name sample_1 --metrics-file sample_1.ataqv.json.gz \
        --excluded-region-file hg19.blacklist.bed.gz \
        --tss-file hg19.tss.refseq.bed.gz \
        --ignore-read-groups human sample_1.md.bam \
         > sample_1.ataqv.out
    
    ataqv --peak-file sample_2_peaks.broadPeak \
        --name sample_2 --metrics-file sample_2.ataqv.json.gz \
        --excluded-region-file hg19.blacklist.bed.gz \
        --tss-file hg19.tss.refseq.bed.gz \ 
        --ignore-read-groups human sample_2.md.bam \
        > sample_2.ataqv.out
    
    ataqv --peak-file sample_3_peaks.broadPeak \
        --name sample_3 --metrics-file sample_3.ataqv.json.gz \
        --excluded-region-file hg19.blacklist.bed.gz \
        --tss-file hg19.tss.refseq.bed.gz \
        --ignore-read-groups human sample_3.md.bam \
         > sample_3.ataqv.out

    mkarv my_fantastic_experiment sample_1.ataqv.json.gz sample_2.ataqv.json.gz sample_3.ataqv.json.gz

   
.. _Github: https://github.com/ParkerLab/ataqv
