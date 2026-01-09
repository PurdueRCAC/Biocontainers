.. _backbone-label:

R-scrnaseq
==============================

Introduction
~~~~~~~~
R is a system for statistical computation and graphics. This is a r/4.2.3 singularity image with main R packages used in single cell RNAseq analysis installed. RStudio is an integrated development environment (IDE) for the R statistical computation and graphics system. In this module, we have some R packages installed: ADAPTS BayesSpace BiocManager CellAnnotatoR cellassign celldex CoGAPS conos DEsingle devtools dittoSeq doSNOW DropletUtils GSVA harmony iCellR leidenbase loupeR M3Drop miQC monocle3 muscat Nebulosa pagoda2 pcaMethods PCAtools preprocessCore projectTILs rliger scCATCH scCustomize scDblFinder scDD scde scDEA sceasy schex SCHNAPPs scHOT scKirby scMappR scMCA sctransform Seurat seurat-wrappers Signac sincell SingleCellExperiment SingleR slingshot SnapATAC SoupX splatter tensorflow terra tidyverse tricycle velocyto.R zellkonverter


| For more information, please check:
| Home page: https://www.rstudio.com/products/rstudio/ 
| Home page: https://www.r-project.org/

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 4.1.1-1-rstudio
- 4.1.1-1
- 4.2.0-rstudio
- 4.2.0
- 4.2.3-rstudio

Commands
~~~~~~~
- R
- Rscript

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load r-scrnaseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run r-scrnaseq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=r-scrnaseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers r-scrnaseq

