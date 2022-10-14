.. _backbone-label:

Antismash
==============================

Introduction
~~~~~~~~
``Antismash`` Antismash allows the rapid genome-wide identification, annotation and analysis of secondary metabolite biosynthesis gene clusters in bacterial and fungal genomes. | For more information, please check its website: https://biocontainers.pro/tools/antismash and its home page: https://docs.antismash.secondarymetabolites.org.

Versions
~~~~~~~~
- 5.1.2
- 6.0.1

Commands
~~~~~~~
- antismash

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load antismash

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Antismash on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 4
    #SBATCH --job-name=antismash
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers antismash 
    
    antismash --cb-general --cb-knownclusters --cb-subclusters --asf --pfam2go --smcog-trees seq.gbk
