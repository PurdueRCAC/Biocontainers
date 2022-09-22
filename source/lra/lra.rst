.. _backbone-label:

Lra
==============================

Introduction
~~~~~~~~
``Lra`` is a sequence alignment program that aligns long reads from single-molecule sequencing (SMS) instruments, or megabase-scale contigs from SMS assemblies. For more information, please check its website: https://biocontainers.pro/tools/lra and its home page on `Github`_.

Versions
~~~~~~~~
- 1.3.2

Commands
~~~~~~~
- lra

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load lra

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Lra on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=lra
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers lra

    lra index genome.fasta
    
    lra align genome.fasta input.fastq -t 12 -p s > output.sam
.. _Github: https://github.com/ChaissonLab/LRA
