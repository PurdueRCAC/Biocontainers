.. _backbone-label:  

r-scrnaseq
============================== 
Introduction
~~~~~~~
``r-scrnaseq`` is a customerized R module based on ``R/4.1.1`` or ``R/4.2.0`` used for scRNAseq analysis. 

In the module, we have some packages installed:  

- BiocManager     1.30.16
- CellChat      1.6.1 
- ProjecTILs    3.0
- Seurat  4.1.0
- SeuratObject    4.0.4
- SeuratWrappers  0.3.0
- monocle3        1.0.0
- SnapATAC        1.0.0
- SingleCellExperiment    1.14.1, 1.16.0
- scDblFinder     1.8.0
- SingleR 1.8.1
- scCATCH 3.0
- scMappR 1.0.7
- rliger  1.0.0
- schex   1.8.0
- CoGAPS  3.14.0
- celldex 1.4.0
- dittoSeq        1.6.0
- DropletUtils    1.14.2
- miQC    1.2.0
- Nebulosa        1.4.0
- tricycle        1.2.0
- pheatmap        1.0.12
- limma   3.48.3, 3.50.0
- tibble  3.1.5 
- tidyr   1.1.4
- readr   2.0.2
- readxl  1.3.1
- purrr   0.3.4
- dplyr   1.0.7
- stringr 1.4.0
- forcats 0.5.1
- ggplot2 3.3.5
- openxlsx        4.2.5


Versions
~~~~~~~~
- 4.1.1-1
- 4.1.1-1-rstudio
- 4.2.0
- 4.2.0-rstudio
- 4.2.3-rstudio
- 4.3.3-rstudio
- 4.4.1-rstudio

Commands
~~~~~~
- R
- Rscript
- rstudio (only for the rstudio version)

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load r-scrnaseq
   # or module load r-scrnaseq/4.2.0
   # If you want to use Rstudio, load the rstudio version
   module load r-scrnaseq/4.1.1-1-rstudio 
   # or module load r-scrnaseq/4.2.0-rstudio 

Install packages
~~~~~  
.. note::
   
   Users can also install packages they need. The installed location depends on the setting in your ``~/.Rprofile``.   
   Detailed guide about installing R packages can be found here: https://www.rcac.purdue.edu/knowledge/bell/run/examples/apps/r/package. 

Interactive job
~~~~~~
To run interactively on our clusters::

   (base) UserID@bell-fe00:~ $ sinteractive -N1 -n12 -t4:00:00 -A myallocation
   salloc: Granted job allocation 12345869
   salloc: Waiting for resource configuration
   salloc: Nodes bell-a008 are ready for job
   (base) UserID@bell-a008:~ $ module load biocontainers r-scrnaseq/4.2.0 # or r-scrnaseq/4.2.0-rstudio 
   (base) UserID@bell-a008:~ $ R
   
   R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
   Copyright (C) 2022 The R Foundation for Statistical Computing
   Platform: x86_64-pc-linux-gnu (64-bit)

   R is free software and comes with ABSOLUTELY NO WARRANTY.
   You are welcome to redistribute it under certain conditions.
   Type 'license()' or 'licence()' for distribution details.

   Natural language support but running in an English locale

   R is a collaborative project with many contributors.
   Type 'contributors()' for more information and
   'citation()' on how to cite R or R packages in publications.

   Type 'demo()' for some demos, 'help()' for on-line help, or
   'help.start()' for an HTML browser interface to help.
   Type 'q()' to quit R.
   

   > library(Seurat)
   > library(monocle3)

Batch job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To submit a sbatch job on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=r_scRNAseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-scrnaseq
 
    Rscript scRNAseq.R
