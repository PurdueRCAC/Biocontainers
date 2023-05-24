.. _backbone-label:

Ncbi-amrfinderplus
==============================

Introduction
~~~~~~~~
``Ncbi-amrfinderplus`` and the accompanying database identify acquired antimicrobial resistance genes in bacterial protein and/or assembled nucleotide sequences as well as known resistance-associated point mutations for several taxa.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/ncbi-amrfinderplus 
| Home page: https://github.com/ncbi/amr

Versions
~~~~~~~~
- 3.10.30
- 3.10.42
- 3.11.2

Commands
~~~~~~~
- amrfinder

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load ncbi-amrfinderplus

.. note::
        AMRFinderPlus database has been setup for users. Users can check the database version by ``amrfinder -V``. RCAC will keep updating database for users. If you notice our database is out of date, you can contact us to update the database.  

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run ncbi-amrfinderplus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=ncbi-amrfinderplus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers ncbi-amrfinderplus

    # Protein AMRFinder with no genomic coordinates
    amrfinder -p test_prot.fa

    # Translated nucleotide AMRFinder (will not use HMMs)
    amrfinder -n test_dna.fa

    # Protein AMRFinder using GFF to get genomic coordinates and 'plus' genes
    amrfinder -p test_prot.fa -g test_prot.gff --plus

    # Protein AMRFinder with Escherichia protein point mutations
    amrfinder -p test_prot.fa -O Escherichia

    # Full AMRFinderPlus search combining results
    amrfinder -p test_prot.fa -g test_prot.gff -n test_dna.fa -O Escherichia --plus
