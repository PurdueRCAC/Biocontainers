.. _backbone-label:

Genomicconsensus
==============================

Introduction
~~~~~~~~
``Genomicconsensus`` is the current PacBio consensus and variant calling suite. For more information, please check its website: https://biocontainers.pro/tools/genomicconsensus and its home page on `Github`_.

Versions
~~~~~~~~
- 2.3.3

Commands
~~~~~~~
- quiver
- arrow
- variantCaller

Module
~~~~~~~~
You can load the modules by::
    
    module load biocontainers
    module load genomicconsensus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run Genomicconsensus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name 
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=genomicconsensus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers genomicconsensus

    quiver -j12 out.aligned_subreads.bam \ 
        -r All4mer.V2.01_Insert-changed.fa  \
        -o consensus.fasta -o consensus.fastq

.. _Github: https://github.com/PacificBiosciences/GenomicConsensus
