.. _backbone-label:

Bowtie
==============================

Introduction
~~~~~~~~
``Bowtie`` is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with a Burrows-Wheeler index to keep its memory footprint small: typically about 2.2 GB for the human genome (2.9 GB for paired-end). 

| For more information, please check its website: https://biocontainers.pro/tools/bowtie and its home page: http://bowtie-bio.sourceforge.net/.

Versions
~~~~~~~~
- 1.3.1-py38

Commands
~~~~~~~
- bowtie
- bowtie-build
- bowtie-inspect

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load bowtie

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Bowtie on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=bowtie
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers bowtie

    bowtie-build ref.fasta ref
    bowtie -p 4 -x ref -1 input_1.fq -2 input_2.fq -S test.sam
