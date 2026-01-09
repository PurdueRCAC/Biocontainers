.. _backbone-label:

R-rnaseq
==============================

Introduction
~~~~~~~~
R is a system for statistical computation and graphics. This is an r-ver:4.3.3 singularity image with RStudio and various R packages used in RNAseq analysis installed. RStudio is an integrated development environment (IDE) for the R statistical computation and graphics system. This is an RStudio IDE together with a plain R-base installation (see https://github.com/rocker-org/rocker/), repackaged by RCAC with an addition of a handful prerequisite libraries (libcurl, libopenssl, libxml2, libcairo2 libXt, etc.) and their header files. In this module, we have various relevant R packages installed, including: beachmat 2.18.1 BiocManager 1.30.22 cellranger 1.1.0 ComplexHeatmap 2.18.0 dbplyr 2.5.0 DESeq2 1.42.1 DEXSeq 1.48.0 dtplyr 1.3.1 edgeR 4.0.16 EnhancedVolcano 1.20.0 genefilter 1.84.0 geneplotter 1.80.0 GenomeInfoDb 1.38.8 GenomicAlignments 1.38.2 GenomicRanges 1.54.1 ggplot2 3.5.0 KEGGREST 1.42.0 limma 3.58.1 openxlsx 4.2.5.2 PCAtools 2.14.0 pheatmap 1.0.12 readr 2.1.5 readxl 1.4.3 Rsamtools 2.18.0 stringr 1.5.1 SummarizedExperiment 1.32.0 tibble 3.2.1 tidyr 1.3.1


| For more information, please check:
| Home page: https://www.rstudio.com/products/rstudio/ 
| Home page: https://www.r-project.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.1.1-1-rstudio
- 4.1.1-1
- 4.3.3-1-rstudio-2023.12.1

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r-rnaseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-rnaseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-rnaseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-rnaseq

