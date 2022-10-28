.. _backbone-label:

Genrich
==============================

Introduction
~~~~~~~~
``Genrich`` is a peak-caller for genomic enrichment assays (e.g. ChIP-seq, ATAC-seq). It analyzes alignment files generated following the assay and produces a file detailing peaks of significant enrichment. 

| For more information, please check its website: https://biocontainers.pro/tools/genrich and its home page on `Github`_.

Versions
~~~~~~~~
- 0.6.1

Commands
~~~~~~~
- Genrich

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load genrich

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Genrich on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genrich
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genrich

    Genrich  -t sample.bam  -o sample.narrowPeak  -v
.. _Github: https://github.com/jsh58/Genrich
