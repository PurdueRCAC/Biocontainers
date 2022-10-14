.. _backbone-label:

Quast
==============================

Introduction
~~~~~~~~
``Quast`` is Quality Assessment Tool for Genome Assemblies.

Note: Running QUAST, please use the command: quast.py|metaquast.py fastafile [OTHER OPTIONS]
DO NOT call it 'python quast.py|metaquast.py'

|For more information, please check its website: https://biocontainers.pro/tools/quast and its home page on `Github`_.

Versions
~~~~~~~~
- 5.0.2-py37

Commands
~~~~~~~
- quast.py
- metaquast.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load quast

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Quast on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 8
    #SBATCH --job-name=quast
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers quast

    metaquast.py  --gene-finding --threads 8  \ 
        meta_contigs_1.fasta meta_contigs_2.fasta \
        -r meta_ref_1.fasta,meta_ref_2.fasta,meta_ref_3.fasta \
        -o quast_out_genefinding
.. _Github: https://bioconda.github.io/recipes/quast/README.html
