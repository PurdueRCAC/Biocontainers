.. _backbone-label:

Gamma
==============================

Introduction
~~~~~~~~
GAMMA (Gene Allele Mutation Microbial Assessment) is a command line tool that finds gene matches in microbial genomic data using protein coding (rather than nucleotide) identity, and then translates and annotates the match by providing the type (i.e., mutant, truncation, etc.) and a translated description (i.e., Y190S mutant, truncation at residue 110, etc.). Because microbial gene families often have multiple alleles and existing databases are rarely exhaustive, GAMMA is helpful in both identifying and explaining how unique alleles differ from their closest known matches.
| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/gamma 
| Home page: https://github.com/rastanton/GAMMA

Versions
~~~~~~~~
- 1.4
- 2.2

Commands
~~~~~~~
- GAMMA-S.py
- GAMMA.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gamma

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gamma on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gamma
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gamma

    GAMMA.py DHQP1701672_complete_genome.fasta ResFinderDB_Combined_05-06-20.fsa GAMMA_Test
