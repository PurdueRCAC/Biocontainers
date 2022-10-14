.. _backbone-label:

Nextclade
==============================

Introduction
~~~~~~~~
``Nextclade`` is a tool that identifies differences between your sequences and a reference sequence, uses these differences to assign your sequences to clades, and reports potential sequence quality issues in your data. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/nextstrain/nextclade and its home page: https://docs.nextstrain.org/projects/nextclade/en/stable/user/nextclade-cli.html.

Versions
~~~~~~~~
- 1.10.3

Commands
~~~~~~~
- nextclade

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nextclade

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nextclade on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nextclade
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nextclade

    mkdir -p data
    nextclade dataset get --name 'sars-cov-2' --output-dir 'data/sars-cov-2'

    nextclade \
        --in-order \
        --input-fasta data/sars-cov-2/sequences.fasta \
        --input-dataset data/sars-cov-2 \
        --output-tsv output/nextclade.tsv \
        --output-tree output/nextclade.auspice.json \
        --output-dir output/ \
        --output-basename nextclade
