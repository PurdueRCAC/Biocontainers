.. _backbone-label:

Gfastats
==============================

Introduction
~~~~~~~~
gfastats is a single fast and exhaustive tool for summary statistics and simultaneous *fa* (fasta, fastq, gfa [.gz]) genome assembly file manipulation. gfastats also allows seamless fasta<>fastq<>gfa[.gz] conversion. It has been tested in genomes even >100Gbp.


| For more information, please check:
| BioContainers: https://biocontainers.pro/tools/gfastats 
| Home page: https://github.com/vgl-hub/gfastats

Versions
~~~~~~~~
- 1.2.3
- 1.3.6

Commands
~~~~~~~
- gfastats

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load gfastats

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run gfastats on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=gfastats
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gfastats

    gfastats input.fasta -o gfa
