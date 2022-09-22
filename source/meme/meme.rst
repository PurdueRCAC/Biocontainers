.. _backbone-label:

Meme
==============================

Introduction
~~~~~~~~
``Meme`` is a collection of tools for the discovery and analysis of sequence motifs. For more information, please check its website: https://biocontainers.pro/tools/meme and its home page: https://meme-suite.org/meme/.

Versions
~~~~~~~~
- 5.3.3
- 5.4.1

Commands
~~~~~~~
- ame
- centrimo
- dreme
- dust
- fimo
- glam2
- glam2scan
- gomo
- mast
- mcast
- meme
- meme-chip
- momo
- purge
- spamo
- tomtom

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load meme

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Meme on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=meme
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers meme

    meme seq.fasta -dna -mod oops -pal

    meme-chip Klf1.fna -o memechip_klf1_out
