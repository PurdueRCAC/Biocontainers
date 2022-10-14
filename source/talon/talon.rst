.. _backbone-label:

Talon
==============================

Introduction
~~~~~~~~
``Talon`` is a Python package for identifying and quantifying known and novel genes/isoforms in long-read transcriptome data sets. |For more information, please check its website: https://biocontainers.pro/tools/talon and its home page on `Github`_.

Versions
~~~~~~~~
- 5.0

Commands
~~~~~~~
- talon
- talon_abundance
- talon_create_GTF
- talon_fetch_reads
- talon_filter_transcripts
- talon_generate_report
- talon_get_sjs
- talon_initialize_database
- talon_label_reads
- talon_reformat_gtf
- talon_summarize

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load talon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Talon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=talon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers talon

.. _Github: https://github.com/mortazavilab/TALON
