.. _backbone-label:

Clairvoyante
==============================

Introduction
~~~~~~~~
Clairvoyante is a deep neural network based variant caller.
|For more information, please check:
|Docker hub: https://hub.docker.com/r/lifebitai/clairvoyante 
|Home page: https://github.com/aquaskyline/Clairvoyante

Versions
~~~~~~~~
- 1.02

Commands
~~~~~~~
- clairvoyante.py

Module
~~~~~~~~
You can load the modules by::

    module load biocontainers
    module load clairvoyante

Example job
~~~~~
.. warning::
    Using ``#!/bin/sh -l`` as shebang in the slurm job script will cause the failure of some biocontainer modules. Please use ``#!/bin/bash`` instead.

To run clairvoyante on our clusters::

    #!/bin/bash
    #SBATCH -A myallocation     # Allocation name
    #SBATCH -t 1:00:00
    #SBATCH -N 1
    #SBATCH -n 1
    #SBATCH --job-name=clairvoyante
    #SBATCH --mail-type=FAIL,BEGIN,END
    #SBATCH --error=%x-%J-%u.err
    #SBATCH --output=%x-%J-%u.out

    module --force purge
    ml biocontainers clairvoyante

    cd training
    clairvoyante.py callVarBam \
       --chkpnt_fn ../trainedModels/fullv3-illumina-novoalign-hg001+hg002-hg38/learningRate1e-3.epoch500 \
       --bam_fn ../testingData/chr21/chr21.bam \
       --ref_fn ../testingData/chr21/chr21.fa \
       --bed_fn ../testingData/chr21/chr21.bed \
       --call_fn chr21_calls.vcf \
       --ctgName chr21
