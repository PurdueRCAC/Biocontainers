.. _backbone-label:

Cutadapt
==============================

Introduction
~~~~~~~~
``Cutadapt`` finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads. 

| For more information, please check its website: https://biocontainers.pro/tools/cutadapt and its home page: https://cutadapt.readthedocs.io/en/stable/.

Versions
~~~~~~~~
- 3.4
- 3.7

Commands
~~~~~~~
- cutadapt

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load cutadapt

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Cutadapt on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=cutadapt
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers cutadapt
    

    cutadapt -a AACCGGTT -o output.fastq input.fastq
