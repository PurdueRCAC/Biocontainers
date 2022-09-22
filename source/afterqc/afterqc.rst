.. _backbone-label:

Afterqc
==============================

Introduction
~~~~~~~~
``Afterqc`` is a tool for quality control of FASTQ data produced by HiSeq 2000/2500/3000/4000, Nextseq 500/550, MiniSeq, and Illumina 1.8 or newer. For more information, please check its website: https://biocontainers.pro/tools/afterqc and its home page on `Github`_.

Versions
~~~~~~~~
- 0.9.7

Commands
~~~~~~~
- after.py

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load afterqc

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run blobtools on our our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=afterqc
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers afterqc

    after.py -1 SRR11941281_1.fastq.paired.fq  -2 SRR11941281_2.fastq.paired.fq

.. _Github: https://github.com/OpenGene/AfterQC
