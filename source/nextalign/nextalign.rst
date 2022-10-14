.. _backbone-label:

Nextalign
==============================

Introduction
~~~~~~~~
``Nextalign`` is a viral genome sequence alignment tool for command line. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/nextstrain/nextalign and its home page: https://docs.nextstrain.org/projects/nextclade/en/stable/user/nextalign-cli.html.

Versions
~~~~~~~~
- 1.10.3

Commands
~~~~~~~
- nextalign

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load nextalign

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Nextalign on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=nextalign
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers nextalign

    nextalign \
         --sequences data/sars-cov-2/sequences.fasta \
         --reference data/sars-cov-2/reference.fasta \
         --genemap data/sars-cov-2/genemap.gff \
        --genes E,M,N,ORF1a,ORF1b,ORF3a,ORF6,ORF7a,ORF7b,ORF8,ORF9b,S \
        --output-dir output/ \
        --output-basename nextalign
