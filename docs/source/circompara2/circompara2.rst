.. _backbone-label:

Circompara2
==============================

Introduction
~~~~~~~~
CirComPara2 is a computational pipeline to detect, quantify, and correlate expression of linear and circular RNAs from RNA-seq data that combines multiple circRNA-detection methods.


| For more information, please check:
| Home page: https://github.com/egaffo/circompara2

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 0.1.2.1
  * - BELL
    - 0.1.2.1
  * - GAUTSCHI
    - 0.1.2.1
  * - NEGISHI
    - 0.1.2.1
  * - SCHOLAR
    - 0.1.2.1

Commands
~~~~~~~
- python
- Rscript
- circompara2
- CIRCexplorer2
- CIRCexplorer_compare.R
- CIRI.pl
- DCC
- DCC_patch_CombineCounts.py
- QRE_finder.py
- STAR
- bedtools
- bowtie
- bowtie-build
- bowtie-inspect
- bowtie2
- bowtie2-build
- bowtie2-inspect
- bwa
- ccp_circrna_expression.R
- cfinder_compare.R
- chimoutjunc_to_bed.py
- ciri_compare.R
- collect_read_stats.R
- convert_circrna_collect_tables.py
- cuffcompare
- cuffdiff
- cufflinks
- cuffmerge
- cuffnorm
- cuffquant
- dcc_compare.R
- dcc_fix_strand.R
- fasta_len.py
- fastq_rev_comp.py
- fastqc
- filterCirc.awk
- filterSpliceSiteCircles.pl
- filter_and_cast_circexp.R
- filter_fastq_reads.py
- filter_findcirc_res.R
- filter_segemehl.R
- find_circ.py
- findcirc_compare.R
- gene_annotation.R
- get_ce2_bwa_bks_reads.R
- get_ce2_bwa_circ_reads.py
- get_ce2_segemehl_bks_reads.R
- get_ce2_star_bks_reads.R
- get_ce2_th_bks_reads.R
- get_circompara_counts.R
- get_circrnaFinder_bks_reads.R
- get_ciri_bks_reads.R
- get_dcc_bks_reads.R
- get_findcirc_bks_reads.R
- get_gene_expression_files.R
- get_stringtie_rawcounts.R
- gffread
- gtfToGenePred
- gtf_collapse_features.py
- gtf_to_sam
- haarz.x
- hisat2
- hisat2-build
- htseq-count
- install_R_libs.R
- nrForwardSplicedReads.pl
- parallel
- pip
- postProcessStarAlignment.pl
- samtools
- samtools_v0
- scons
- segemehl.x
- split_start_end_gtf.py
- starCirclesToBed.pl
- stringtie
- testrealign_compare.R
- tophat2
- trim_read_header.py
- trimmomatic-0.39.jar
- unmapped2anchors.py
- cf_filterChimout.awk
- circompara
- get_unmapped_reads_from_bam.sh
- install_circompara
- make_circrna_html
- make_indexes

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load circompara2

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run circompara2 on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=circompara2
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers circompara2
