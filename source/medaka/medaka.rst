.. _backbone-label:

Medaka
==============================

Introduction
~~~~~~~~
``Medaka`` is a tool to create consensus sequences and variant calls from nanopore sequencing data. 

| For more information, please check its | Docker hub: https://hub.docker.com/r/ontresearch/medaka and its home page on `Github`_.

Versions
~~~~~~~~
- 1.6.0

Commands
~~~~~~~
- medaka
- medaka_consensus
- medaka_counts
- medaka_data_path
- medaka_haploid_variant
- medaka_version_report

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load medaka

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Medaka on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=medaka
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers medaka

.. _Github: https://github.com/nanoporetech/medaka
