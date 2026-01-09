.. _backbone-label:

FASTX-Toolkit
==============================

Introduction
~~~~~~~~
``FASTX-Toolkit`` is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing. 

| For more information, please check its website: https://biocontainers.pro/tools/fastx_toolkit and its home page on `Github`_.

Versions
~~~~~~~
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Version(s)

  * - ANVIL
    - 0.0.14
  * - BELL
    - 0.0.14
  * - GAUTSCHI
    - 0.0.14
  * - NEGISHI
    - 0.0.14
  * - SCHOLAR
    - 0.0.14

Commands
~~~~~~~
- fasta_clipping_histogram.pl
- fasta_formatter
- fasta_nucleotide_changer
- fastq_masker
- fastq_quality_boxplot_graph.sh
- fastq_quality_converter
- fastq_quality_filter
- fastq_quality_trimmer
- fastq_to_fasta
- fastx_artifacts_filter
- fastx_barcode_splitter.pl
- fastx_clipper
- fastx_collapser
- fastx_nucleotide_distribution_graph.sh
- fastx_nucleotide_distribution_line_graph.sh
- fastx_quality_stats
- fastx_renamer
- fastx_reverse_complement
- fastx_trimmer
- fastx_uncollapser

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load fastx_toolkit

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run FASTX-Toolkit on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastx_toolkit
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastx_toolkit

.. _Github: https://github.com/agordon/fastx_toolkit
