.. _backbone-label:

Stacks
==============================

Introduction
~~~~~~~~
``Stacks`` is a software pipeline for building loci from RAD-seq. 
| For more information, please check its website: https://biocontainers.pro/tools/stacks and its home page: https://catchenlab.life.illinois.edu/stacks/.

Versions
~~~~~~~~
- 2.60

Commands
~~~~~~~
- clone_filter
- count_fixed_catalog_snps.py
- cstacks
- denovo_map.pl
- gstacks
- integrate_alignments.py
- kmer_filter
- phasedstacks
- populations
- process_radtags
- process_shortreads
- ref_map.pl
- sstacks
- stacks-dist-extract
- stacks-gdb
- stacks-integrate-alignments
- tsv2bam
- ustacks

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load stacks

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Stacks on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=stacks
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers stacks
    
    denovo_map.pl -T 8 -M 4 -o ./stacks/  \
        --samples ./samples --popmap ./popmaps/popmap
