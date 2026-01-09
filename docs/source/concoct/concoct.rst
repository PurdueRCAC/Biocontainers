.. _backbone-label:

Concoct
==============================

Introduction
~~~~~~~~
Concoct is a program for unsupervised binning of metagenomic contigs by using nucleotide composition, coverage data in multiple samples and linkage data from paired end reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/concoct 
| Home page: https://github.com/BinPro/CONCOCT

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 1.1.0

Commands
~~~~~~~
- concoct_refine
- concoct
- merge_cutup_clustering.py
- extract_fasta_bins.py
- cut_up_fasta.py
- concoct_coverage_table.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load concoct

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run concoct on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=concoct
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers concoct

