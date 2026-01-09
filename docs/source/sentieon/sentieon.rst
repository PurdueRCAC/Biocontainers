.. _backbone-label:

Sentieon
==============================

Introduction
~~~~~~~~
Sentieon Sequencer Agnostic Secondary Analysis - FASTQ-BAM-VCF-GVCF


| For more information, please check:
| BioContainers: 
| Home page: ########################

.. note::
    Please follow the recommended citation guidelines from the developers when you use the tool in research.

Versions
~~~~~~~~
- 202503

Commands
~~~~~~~
- sentieon

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load sentieon

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run sentieon on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=sentieon
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers sentieon

