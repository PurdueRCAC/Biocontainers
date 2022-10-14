.. _backbone-label:

Cellranger-atac
==============================

Introduction
~~~~~~~~
``Cellranger-atac`` is a set of analysis pipelines that process Chromium Single Cell ATAC data. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/cumulusprod/cellranger-atac and its home page: https://support.10xgenomics.com/single-cell-atac/software/pipelines/latest/algorithms/overview.

Versions
~~~~~~~~
- 2.0.0
- 2.1.0

Commands
~~~~~~~
- cellranger-atac

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cellranger-atac

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cellranger-atac on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --mem=64G
    #SBATCH --job-name=cellranger-atac
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cellranger-atac

    cellranger-atac count --id=sample345 \
                        --reference=refdata-cellranger-arc-GRCh38-2020-A-2.0.0 \
                        --fastqs=runs/HAWT7ADXX/outs/fastq_path \
                        --sample=mysample \
                        --localcores=8 \
                        --localmem=64
