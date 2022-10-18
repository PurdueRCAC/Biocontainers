.. _backbone-label:

Tobias
==============================

Introduction
~~~~~~~~
``Tobias`` is a collection of command-line bioinformatics tools for performing footprinting analysis on ATAC-seq data. 

| For more information, please check its website: https://biocontainers.pro/tools/tobias and its home page on `Github`_.

Versions
~~~~~~~~
- 0.13.3

Commands
~~~~~~~
- TOBIAS

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load tobias

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Tobias on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=tobias
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tobias

    TOBIAS DownloadData --bucket data-tobias-2020
    mv data-tobias-2020/ test_data/

    TOBIAS PlotAggregate --TFBS test_data/BATF_all.bed \
         --signals test_data/Bcell_corrected.bw test_data/Tcell_corrected.bw \
         --output BATFJUN_footprint_comparison_all.pdf \
         --share_y both --plot_boundaries --signal-on-x

    TOBIAS BINDetect --motifs test_data/motifs.jaspar \
         --signals test_data/Bcell_footprints.bw test_data/Tcell_footprints.bw \
         --genome test_data/genome.fa.gz \
         --peaks test_data/merged_peaks_annotated.bed \
         --peak_header test_data/merged_peaks_annotated_header.txt \
         --outdir BINDetect_output --cond_names Bcell Tcell --cores 8

    TOBIAS ATACorrect --bam test_data/Bcell.bam \
        --genome test_data/genome.fa.gz \
        --peaks test_data/merged_peaks.bed \
        --blacklist test_data/blacklist.bed \
        --outdir ATACorrect_test --cores 8

    TOBIAS FootprintScores --signal test_data/Bcell_corrected.bw \
        --regions test_data/merged_peaks.bed \
        --output Bcell_footprints.bw --cores 8

.. _Github: https://github.com/loosolab/TOBIAS
