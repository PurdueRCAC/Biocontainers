.. _backbone-label:

Whatshap
==============================

Introduction
~~~~~~~~
Whatshap is a software for phasing genomic variants using DNA sequencing reads, also called read-based phasing or haplotype assembly. It is especially suitable for long reads, but works also well with short reads.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/whatshap 
| Home page: https://github.com/whatshap/whatshap

Versions
~~~~~~~~
- 1.4

Commands
~~~~~~~
- whatshap

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load whatshap

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run whatshap on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=whatshap
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers whatshap

    whatshap phase --indels \ 
        --reference=reference.fasta \
        variants.vcf pacbio.bam
