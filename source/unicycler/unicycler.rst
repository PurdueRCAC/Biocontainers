.. _backbone-label:

Unicycler
==============================

Introduction
~~~~~~~~
``Unicycler`` is an assembly pipeline for bacterial genomes. For more information, please check its website: https://biocontainers.pro/tools/unicycler and its home page on `Github`_.

Versions
~~~~~~~~
- 0.5.0

Commands
~~~~~~~
- unicycler

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load unicycler

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Unicycler on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=unicycler
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers unicycler

    unicycler -t 12 -1 SRR11234553_1.fastq  -2 SRR11234553_2.fastq -o shortout

    unicycler -t 12  -l SRR3982487.fastq  -o longout
    
.. _Github: https://github.com/rrwick/Unicycler
