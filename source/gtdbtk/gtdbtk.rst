.. _backbone-label:  

GTDB-Tk
==============================

Introduction
~~~~~~~
``GTDB-Tk`` is a software toolkit for assigning objective taxonomic classifications to bacterial and archaeal genomes based on the Genome Database Taxonomy GTDB. It is designed to work with recent advances that allow hundreds or thousands of metagenome-assembled genomes (MAGs) to be obtained directly from environmental samples. It can also be applied to isolate and single-cell genomes.   

GTDB-Tk reference data (`R202`_) has been downloaded for users. 

Versions
~~~~~~~~
- 1.7.0
- 2.1.0

Commands
~~~~~~
- gtdbtk

Module
~~~~~~~
    module load biocontainers
    module load gtdbtk/1.7.0

Example job
~~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run GTDB-Tk our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 20:00:00
    #SBATCH -N 1
    #SBATCH -n 24
    #SBATCH --job-name=gtdbtk
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers gtdbtk/1.7.0

    gtdbtk identify --genome_dir genomes --out_dir identify --extension gz --cpus 8
    gtdbtk align --identify_dir identify --out_dir align --cpus 8
    gtdbtk classify --genome_dir genomes --align_dir align --out_dir classify --extension gz --cpus 8














.. _R202: https://gtdb.ecogenomic.org 
