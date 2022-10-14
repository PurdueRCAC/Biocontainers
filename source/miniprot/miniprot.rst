.. _backbone-label:

Miniprot
==============================

Introduction
~~~~~~~~
Miniprot aligns a protein sequence against a genome with affine gap penalty, splicing and frameshift. It is primarily intended for annotating protein-coding genes in a new species using known genes from other species. Miniprot is similar to GeneWise and Exonerate in functionality but it can map proteins to whole genomes and is much faster at the residue alignment step.
For more information, please check:
Home page: https://github.com/lh3/miniprot

Versions
~~~~~~~~
- 0.3

Commands
~~~~~~~
- miniprot

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load miniprot

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run miniprot on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=miniprot
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers miniprot
