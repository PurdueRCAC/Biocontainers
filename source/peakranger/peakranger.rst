.. _backbone-label:

Peakranger
==============================

Introduction
~~~~~~~~
``Peakranger`` is a multi-purporse software suite for analyzing next-generation sequencing (NGS) data. 

| For more information, please check its website: https://biocontainers.pro/tools/peakranger and its home page: http://ranger.sourceforge.net.

Versions
~~~~~~~~
- 1.18

Commands
~~~~~~~
- peakranger

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load peakranger

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Peakranger on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=peakranger
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers peakranger

    peakranger ccat --format bam  27-1_sorted_MDRD_MQ30filtered.bam 27-4_sorted_MDRD_MQ30filtered.bam \
         ccat_result_with_HTML_report_5kb_region --report \
         --gene_annot_file refGene.txt --plot_region 10000
