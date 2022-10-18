.. _backbone-label:

HTSeq
==============================

Introduction
~~~~~~~~
``HTSeq`` is a Python library to facilitate processing and analysis of data from high-throughput sequencing (HTS) experiments. 

| For more information, please check its website: https://biocontainers.pro/tools/htseq and its home page on `Github`_.

Versions
~~~~~~~~
- 0.13.5
- 1.99.2
- 2.0.1

Commands
~~~~~~~
- htseq-count
- htseq-count-barcodes
- htseq-qa
- python
- python3

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load htseq

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run HTSeq on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=htseq
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers htseq

    python -m HTSeq.scripts.count \
           -f bam input.bam ref.gtf \
           > test.out
.. _Github: https://github.com/htseq/htseq
