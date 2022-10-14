.. _backbone-label:

Freebayes
==============================

Introduction
~~~~~~~~
``Freebayes`` is a Bayesian genetic variant detector designed to find small polymorphisms, specifically SNPs (single-nucleotide polymorphisms), indels (insertions and deletions), MNPs (multi-nucleotide polymorphisms), and complex events (composite insertion and substitution events) smaller than the length of a short-read sequencing alignment. | For more information, please check its website: https://biocontainers.pro/tools/freebayes and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3.5-py38
- 1.3.6

Commands
~~~~~~~
- freebayes
- freebayes-parallel

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load freebayes

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Freebayes on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=freebayes
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers freebayes

    freebayes -f ref.fa aln.cram >var.vcf
.. _Github: https://github.com/freebayes/freebayes
