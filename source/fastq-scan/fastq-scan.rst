.. _backbone-label:

Fastq-scan
==============================

Introduction
~~~~~~~~
Fastq-scan reads a FASTQ from STDIN and outputs summary statistics (read lengths, per-read qualities, per-base qualities) in JSON format.


| For more information, please check:
| Docker hub: https://hub.docker.com/r/staphb/fastq-scan 
| Home page: https://github.com/rpetit3/fastq-scan

Versions
~~~~~~~~
- 1.0.0

Commands
~~~~~~~
- fastq-scan

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load fastq-scan

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run fastq-scan on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=fastq-scan
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers fastq-scan

    cat example-q33.fq | fastq-scan -g 150000
