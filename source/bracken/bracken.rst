.. _backbone-label:  

Bracken
============================== 

Introduction
~~~~~~~
``Bracken``  (Bayesian Reestimation of Abundance with KrakEN) is a highly accurate statistical method that computes the abundance of species in DNA sequences from a metagenomics sample.

Detailed usage can be found here: https://github.com/jenniferlu717/Bracken

.. note::
  Inside the ``bracken`` container image, ``kraken2`` was also installed. As a result, when you load ``bracken/2.6.1-py37``, ``kraken version 2.1.1`` will be automatically loaded. Please do not load ``kraken2`` module together with ``bracken`` module to avaoid conflict. 

Versions
~~~~~~~~
- 2.6.1-py37
- 2.7-py39

Commands
~~~~~~
- bracken
- bracken-build
- combine_bracken_outputs.py
- kraken2
- kraken2-build
- kraken2-inspect
- combine_bracken_outputs.py
- est_abundance.py
- generate_kmer_distribution.py

Module
~~~~~~~
You can load the modules by::

    module load biocontainers
    module load bracken/2.6.1-py37

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run bracken on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 10:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=bracken
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bracken/2.6.1-py37
    
    DATABASE=minikraken2_v2_8GB_201904_UPDATE
    kraken2 --threads 24  --report kranken2.report --db $DATABASE --paired --classified-out cseqs#.fq SRR5043021_1.fastq SRR5043021_2.fastq
    bracken -d  $DATABASE -i kranken2.report -o bracken_output -w bracken.report  
    
