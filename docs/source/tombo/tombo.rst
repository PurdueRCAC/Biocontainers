.. _backbone-label:

Tombo
==============================

Introduction
~~~~~~~~
``Tombo`` is a suite of tools primarily for the identification of modified nucleotides from nanopore sequencing data. Tombo also provides tools for the analysis and visualization of raw nanopore signal. 

| For more information, please check its website: https://biocontainers.pro/tools/ont-tombo and its home page on `Github`_.

Versions
.. list-table::
  :width: 100 %
  :widths: 25 75
  :header-rows: 1

  * - Cluster
    - Versions

  * - ANVIL
    - 1.5.1
  * - BELL
    - 1.5.1
  * - GAUTSCHI
    - 1.5.1
  * - NEGISHI
    - 1.5.1
  * - SCHOLAR
    - 1.5.1

Commands
~~~~~~~
- tombo

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load tombo

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Tombo on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=tombo
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers tombo
    
    tombo resquiggle path/to/fast5s/ genome.fasta --processes 4 --num-most-common-errors 5
    tombo detect_modifications alternative_model --fast5-basedirs path/to/fast5s/ \
        --statistics-file-basename native.e_coli_sample \
        --alternate-bases dam dcm --processes 4

    # plot raw signal at most significant dcm locations
    tombo plot most_significant --fast5-basedirs path/to/fast5s/ \
        --statistics-filename native.e_coli_sample.dcm.tombo.stats \
        --plot-standard-model --plot-alternate-model dcm \
        --pdf-filename sample.most_significant_dcm_sites.pdf

    # produces wig file with estimated fraction of modified reads at each valid reference site
    tombo text_output browser_files --statistics-filename native.e_coli_sample.dam.tombo.stats \
         --file-types dampened_fraction --browser-file-basename native.e_coli_sample.dam
    # also produce successfully processed reads coverage file for reference
    tombo text_output browser_files --fast5-basedirs path/to/fast5s/ \
        --file-types coverage --browser-file-basename native.e_coli_sample

.. _Github: https://github.com/nanoporetech/tombo
