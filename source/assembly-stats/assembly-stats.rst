.. _backbone-label:

Assembly-stats
==============================

Introduction
~~~~~~~~
``Assembly-stats`` is a tool to get assembly statistics from FASTA and FASTQ files. | For more information, please check its website: https://biocontainers.pro/tools/assembly-stats and its home page on `Github`_.

Versions
~~~~~~~~
- 1.0.1

Commands
~~~~~~~
- assembly-stats

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load assembly-stats

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Assembly-stats on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 00:10:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=assembly-stats
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers assembly-stats

    assembly-stats seq.fasta
    
.. _Github: https://github.com/sanger-pathogens/assembly-stats
