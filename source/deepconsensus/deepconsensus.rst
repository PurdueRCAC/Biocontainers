.. _backbone-label:

Deepconsensus
==============================

Introduction
~~~~~~~~
DeepConsensus uses gap-aware sequence transformers to correct errors in Pacific Biosciences (PacBio) Circular Consensus Sequencing (CCS) data.
|For more information, please check:
|Docker hub: https://hub.docker.com/r/google/deepconsensus 
|Home page: https://github.com/google/deepconsensus

Versions
~~~~~~~~
- 0.2.0

Commands
~~~~~~~
- deepconsensus
- ccs
- actc

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load deepconsensus

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run deepconsensus on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=deepconsensus
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers deepconsensus

    deepconsensus run \
        --subreads_to_ccs=subreads_to_ccs.bam  \
        --ccs_fasta=ccs.fasta \
        --checkpoint=checkpoint-50 \
        --output=output.fastq \
        --batch_zmws=100
