.. _backbone-label:

Guppy
==============================

Introduction
~~~~~~~~
``Guppy`` is a data processing toolkit that contains the Oxford Nanopore Technologies’ basecalling algorithms, and several bioinformatic post-processing features. |For more information, please check its |Docker hub: https://hub.docker.com/r/genomicpariscentre/guppy and its home page: https://community.nanoporetech.com.

Versions
~~~~~~~~
- 6.0.1

Commands
~~~~~~~
- guppy_aligner
- guppy_barcoder
- guppy_basecall_server
- guppy_basecaller
- guppy_basecaller_duplex
- guppy_basecaller_supervisor
- guppy_basecall_client

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load guppy

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Guppy on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 12
    #SBATCH --job-name=guppy
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers guppy

    guppy_basecaller --compress_fastq -i data/fast5_tiny/ \
        -s basecall_tiny/ --cpu_threads_per_caller 12 \
        --num_callers 1 -c dna_r9.4.1_450bps_hac.cfg
