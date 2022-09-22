.. _backbone-label:

Nanopolish
==============================

Introduction
~~~~~~~~
``Nanopolish`` is a software package for signal-level analysis of Oxford Nanopore sequencing data. For more information, please check its website: https://biocontainers.pro/tools/nanopolish and its home page on `Github`_.

Versions
~~~~~~~~
- 0.13.2
- 0.14.0

Commands
~~~~~~~
- nanopolish

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nanopolish

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nanopolish on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nanopolish
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nanopolish

    nanopolish index -d fast5_files/ reads.fasta

    nanopolish variants --consensus \
        -o polished.vcf -w "tig00000001:200000-202000" \
         -r reads.fasta -b reads.sorted.bam  -g draft.fa

.. _Github: https://github.com/jts/nanopolish
