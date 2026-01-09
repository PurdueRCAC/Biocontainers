.. _backbone-label:  

r-rnaseq
============================== 
Introduction
~~~~~~~
``r-rnaseq`` is a customerized R module based on ``R/4.1.1`` used for RNAseq analysis. 

In the module, we have some packages installed:  

- BiocManager     1.30.16
- ComplexHeatmap  2.9.4
- DESeq2  1.34.0
- edgeR   3.36.0
- pheatmap        1.0.12
- limma   3.48.3
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
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 4.1.1-1, 4.3.3-1-rstudio-2023.12.1
  * - BELL
    - 4.1.1-1, 4.3.3-1-rstudio-2023.12.1
  * - GAUTSCHI
    - 4.1.1-1, 4.3.3-1-rstudio-2023.12.1
  * - NEGISHI
    - 4.1.1-1, 4.3.3-1-rstudio-2023.12.1
  * - SCHOLAR
    - 4.1.1-1, 4.3.3-1-rstudio-2023.12.1

Commands
~~~~~~
- R
- Rscript
- rstudio (only for the rstudio version)

Module
~~~~~~~
You can load the modules by::
 
   module load biocontainers  
   module load r-rnaseq/4.1.1-1
   # If you want to use Rstudio, load the rstudio version
   module load r-rnaseq/4.1.1-1-rstudio 

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
   (base) UserID@bell-a008:~ $ module load biocontainers r-rnaseq/4.1.1-1 # or r-rnaseq/4.1.1-1-rstudio 
   (base) UserID@bell-a008:~ $ R
   
   R version 4.1.1 (2021-08-10) -- "Kick Things"
   Copyright (C) 2021 The R Foundation for Statistical Computing
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
   

   > library(edgeR)
   > library(pheatmap)

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
    #SBATCH --job-name=r_RNAseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-rnaseq
 
    Rscript RNAseq.R
