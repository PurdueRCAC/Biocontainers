.. _backbone-label:

Strique
==============================

Introduction
~~~~~~~~
STRique is a python package to analyze repeat expansion and methylation states of short tandem repeats (STR) in Oxford Nanopore Technology (ONT) long read sequencing data.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/giesselmann/strique 
| Home page: https://github.com/giesselmann/STRique

Versions
~~~~~~~~
- 0.4.2

Commands
~~~~~~~
- STRique.py
- STRique_test.py
- fast5Masker.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load strique

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run strique on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=strique
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers strique

    STRique_test.py
    STRique.py index data/ > data/reads.fofn
    cat data/c9orf72.sam |  STRique.py count ./data/reads.fofn ./models/r9_4_450bps.model ./configs/repeat_config.tsv --config ./configs/STRique.json
