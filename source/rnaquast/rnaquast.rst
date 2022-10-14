.. _backbone-label:

Rnaquast
==============================

Introduction
~~~~~~~~
``Rnaquast`` is a quality assessment tool for de novo transcriptome assemblies. |For more information, please check its website: https://biocontainers.pro/tools/rnaquast and its home page: http://cab.spbu.ru/software/rnaquast/.

Versions
~~~~~~~~
- 2.2.1

Commands
~~~~~~~
- rnaQUAST.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load rnaquast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Rnaquast on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=rnaquast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers rnaquast

    rnaQUAST.py -t 12 -o output \
         --transcripts test_data/Trinity.fasta test_data/idba.fasta \
         --reference test_data/Saccharomyces_cerevisiae.R64-1-1.75.dna.toplevel.fa \
         --gtf test_data/Saccharomyces_cerevisiae.R64-1-1.75.gtf
