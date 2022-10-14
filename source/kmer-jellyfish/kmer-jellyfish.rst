.. _backbone-label:

Jellyfish
==============================

Introduction
~~~~~~~~
``Jellyfish`` is a tool for fast, memory-efficient counting of k-mers in DNA. A k-mer is a substring of length k, and counting the occurrences of all such substrings is a central step in many analyses of DNA sequence. |For more information, please check its website: https://biocontainers.pro/tools/kmer-jellyfish and its home page: http://www.genome.umd.edu/jellyfish.html.

Versions
~~~~~~~~
- 2.3.0

Commands
~~~~~~~
- jellyfish

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load kmer-jellyfish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Jellyfish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=kmer-jellyfish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers kmer-jellyfish

    jellyfish count -m 16 -s 100M -t 12 \
         -o mer_counts -c 7  input.fastq
