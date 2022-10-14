.. _backbone-label:

PanPhlAn
==============================

Introduction
~~~~~~~~
``PanPhlAn`` (Pangenome-based Phylogenomic Analysis) is a strain-level metagenomic profiling tool for identifying the gene composition and in-vivo transcriptional activity of individual strains in metagenomic samples. 

| For more information, please check its home page: http://segatalab.cibio.unitn.it/tools/panphlan/.

Versions
~~~~~~~~
- 3.1

Commands
~~~~~~~
- panphlan_download_pangenome.py
- panphlan_map.py
- panphlan_profiling.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load panphlan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run PanPhlAn on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=panphlan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers panphlan
